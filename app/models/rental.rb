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

  def book_day(date, booking_class: Booking)
    bookings << booking_class.create(date: date, rental_id: id)
    save
  end
end
