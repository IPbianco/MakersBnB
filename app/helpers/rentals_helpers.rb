# require 'json'

def get_rentals(rental_class: Rental)
  rental_class.all.to_json
end
