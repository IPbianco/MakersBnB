class Rental
  include DataMapper::Resource

  property :id, Serial

  has n, :bookings
end
