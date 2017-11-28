class Rental
  include DataMapper::Resource

  property :id, Serial
  property :price, Integer
  property :address, String

  has n, :bookings

  def booked_dates
    bookings.map(&:date)
  end

  def available?(range)
    (Array(range) & booked_dates).empty?
  end
end
