require 'rake'

namespace :db do
  task :create do
    ['development', 'test'].each do |name|
      system("createdb makersbnb_#{name}")
    end
  end
end
