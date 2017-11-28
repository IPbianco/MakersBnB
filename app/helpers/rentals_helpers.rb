require 'date'

def rentals_to_json(rental_class: Rental)
  rental_class.all.to_json
end

def available?(id, start, finish, rental_class: Rental)
  rental = rental_class.first(id)
  rental.available? (start..finish)
end
  
