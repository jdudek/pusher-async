# Pusher::Async

Pusher allows you to make async requests provided you're running within EventMachine loop. This is often not the case when you're using non-evented server like Unicorn. Pusher::Async will run EventMachine reactor in separate thread to allow you making async requests within this thread.

Pusher::Async will also gracefully handle forking and start the reactor thread in child processes.

WARNING: this was very barely tested so expect things to break!

## Usage

### Within Rails

Just add 

    gem "pusher-async"

to your Gemfile. This will add a middleware to your app that will take care of starting EventMachine in forked processes.

### Outside of Rails

Add the middleware to your Rack app manually.

## Notes

If you want to attach callbacks/errbacks to deferreds returned from Pusher requests, keep in mind they will run in different thread (the one EventMachine uses). Issues with thread-safety may arise.

You should be fine if all you need is to trigger Pusher events and you don't check for request result.

## Inspired by

* http://www.railstips.org/blog/archives/2011/05/04/eventmachine-and-passenger/
* http://rubyforge.org/pipermail/mongrel-unicorn/2012-July/001478.html

## License

MIT.
