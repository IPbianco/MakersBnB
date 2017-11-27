require 'data_mapper'
require 'dm-postgres-adapter'
require 'require_all'

require_rel 'models/*.rb'

DataMapper.setup(
  :default, ENV['DATABASE_URL'] ||
  "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")

DataMapper.finalize
