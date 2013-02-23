require "pusher-async/middleware"

module Pusher
  module Async
    class Railtie < Rails::Railtie
      initializer "pusher-async.insert_middleware" do |app|
        app.config.middleware.insert 0, Pusher::Async::Middleware
      end
    end
  end
end
