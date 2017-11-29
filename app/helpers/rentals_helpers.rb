require 'date'

def rentals_to_json(rental_class: Rental)
  rental_class.all.to_json
end

def available?(id, start, finish, rental_class: Rental)
  rental = rental_class.first(id: id)
  return 200 if availability_to_json(rental.available?((start..finish)))
  409
end

def availability_to_json(state)
  { available: state }.to_json
end

def parse_dates(params, date_class: Date)
  [params[:start], params[:finish]].map { |date| date_class.parse(date) }
end
