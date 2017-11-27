ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require 'date'
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

  task :populate do
    10.times do |index| 
      rental = Rental.create(price: index * 1000, address: 'nowhere')
      bookings = 10.times.map do |extra|
        Booking.create(rental_id: rental.id, date: Date.today + index + extra)
      end
      rental.bookings = bookings
    end
  end
end
