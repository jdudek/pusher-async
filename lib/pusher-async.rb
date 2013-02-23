require "eventmachine"
require "pusher"
require "pusher-async/version"

module Pusher
  module Async
    class << self
      def spawn
        unless EM.reactor_running?
          Thread.new { EM.run }
          # TODO learn how to handle it properly in Unicorn
          # Signal.trap("INT")  { EM.stop }
          # Signal.trap("TERM") { EM.stop }
        end
      end

      def respawn
        EM.stop if EM.reactor_running?
        spawn
      end
    end
  end

  class Request
    alias :send_async_without_next_tick :send_async

    def send_async
      # https://github.com/eventmachine/eventmachine/wiki/FAQ
      # "if you do EM::connect from a different thread [...] put your EM::connect stuffs in a next_tick call."

      df = EM::DefaultDeferrable.new
      EM.next_tick {
        send_async_without_next_tick
          .callback { |response| df.succeed(response) }
          .errback  { |error| df.fail(error) }
      }
      df
    end
  end
end

require "pusher-async/railtie" if defined?(Rails)
