# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

require 'rack/reverse_proxy'

use Rack::ReverseProxy do
  reverse_proxy /^\/blog(.*)$/, 'http://www.foster154.com$1', opts={:preserve_host => true}
end

run Rails.application
