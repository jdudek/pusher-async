module Pusher
  module Async
    class Middleware
      def initialize(app)
        @app = app
        initialize_parent
      end

      def call(env)
        initialize_forked_child if forked_child?
        @app.call(env)
      end

      private

      def initialize_parent
        @initial_pid = $$
        Pusher::Async.spawn
      end

      def initialize_forked_child
        @initial_pid = $$
        Pusher::Async.respawn
      end

      def forked_child?
        @initial_pid != $$
      end
    end
  end
end
