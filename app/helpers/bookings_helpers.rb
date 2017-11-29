def bookings_to_json(booking_class: Booking)
  booking_class.all.to_json
end

def book(id, start, finish, rental_class: Rental)
  return 404 if rental_class.first(id: id).nil?
  available?(id, start, finish) && 
    rental_class.first(id: id).book(start..finish)
end
