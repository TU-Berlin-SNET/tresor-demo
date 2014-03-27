# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

use Rack::TCTP

module Rack
  class Lint
    def call(env = nil)
      @app.call(env)
    end
  end
end

run Demonstrator::Application
