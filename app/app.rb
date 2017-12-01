ENV['RACK_ENV'] ||= 'development'

require 'carrierwave'
require 'carrierwave/datamapper'
require 'require_all'
require 'json'
require 'sinatra/base'
require 'sinatra/cross_origin'

require_rel 'server.rb'
require_rel 'db-setup.rb'
require_rel 'controllers/*.rb'
require_rel 'helpers/*.rb'
require_rel 'models/*.rb'
