# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pusher-async/version'

Gem::Specification.new do |gem|
  gem.name          = "pusher-async"
  gem.version       = Pusher::Async::VERSION
  gem.authors       = ["Jan Dudek"]
  gem.email         = ["jd@jandudek.com"]
  gem.description   = %q{Allows asynchronous use of Pusher by running EventMachine in separate thread}
  gem.summary       = %q{Allows asynchronous use of Pusher by running EventMachine in separate thread}
  gem.homepage      = "https://github.com/jdudek/pusher-async"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "pusher", "~> 0.11.3"
  gem.add_dependency "em-http-request", "~> 1.0.0"
end
