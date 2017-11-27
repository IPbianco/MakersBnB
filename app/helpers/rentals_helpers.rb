require 'date'

def get_rentals(rental_class: Rental)
  rental_class.all.to_json
end

def check_dates(id, start, finish, rental_class: Rental)
  (Array((start + 1)...finish) & 
   rental_class.first(id).bookings.map(&:date)).empty?
end
  

