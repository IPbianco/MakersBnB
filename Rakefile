ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require 'date'
require 'rake'
require_relative 'app/db-setup'

images = ['https://i.pinimg.com/564x/c1/45/b4/c145b4fa6322048fce85cba6b2bcf0ed.jpg',
          'https://i.pinimg.com/564x/75/f7/d0/75f7d06a433fc20bea883fe6203ba70e.jpg',
          'https://i.pinimg.com/564x/c7/c9/fb/c7c9fbdde85aaf2ce15cac4d0c45e9b6.jpg']


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
    user = User.create(email: 'maoineoif@gmail.com', hashed_password: 'eugbirnfytrefd')
    10.times do |index|
      rental = Rental.create(price: index * 1000, address: 'nowhere', image: images[index % 3], user_id: 1)
      bookings = 10.times.map do |extra|
        Booking.create(rental_id: rental.id, date: Date.today + index + extra)
      end
      rental.bookings = bookings
    end
  end

  task :populate_test do
    DataMapper.setup(:default, "postgres://localhost/makersbnb_test")
    DataMapper.finalize
    DataMapper.auto_migrate!
    10.times do |index|
      rental = Rental.create(price: 78000, address: 'nowhere', image: images[index % 3])
      bookings = 10.times.map do |extra|
        Booking.create(rental_id: rental.id, date: Date.today + index + extra)
      end
      rental.bookings = bookings
    end
  end
end
