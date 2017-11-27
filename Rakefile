ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require 'rake'
require_relative 'app/db-setup'

namespace :db do
  task :create do
    ['development', 'test'].each do |name|
      system("createdb makersbnb_#{name}")
    end
  end

  task :migrate do
    DataMapper.auto_migrate!
  end

  task :upgrade do
    DataMapper.auto_upgrade!
  end
end
