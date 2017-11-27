class Rental
  include DataMapper::Resource

  property :id, Serial
  property :price, Integer
  property :address, String

  has n, :bookings
end
