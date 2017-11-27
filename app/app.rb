ENV['RACK_ENV'] ||= 'development'

require 'require_all'
require 'json'
require 'sinatra/base'

require_rel 'server.rb'
require_rel 'controllers/*.rb'
require_rel 'helpers/*.rb'
