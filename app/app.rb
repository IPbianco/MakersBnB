ENV['RACK_ENV'] ||= 'development'

require 'require_all'
require 'sinatra/base'

require_rel 'server.rb'
require_rel 'controllers/*.rb'
