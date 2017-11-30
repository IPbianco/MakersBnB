require 'date'

def rental_to_json(id, rental_class: Rental)
  rental_class.get(id).to_hash.to_json
end

def rentals_to_json(rental_class: Rental)
  rental_class.all.map(&:to_hash).to_json
end

def available?(id, start, finish, rental_class: Rental)
  rental = rental_class.first(id: id)
  rental.available?((start..finish))
end

# def availability_to_json(state)
#   { available: state }.to_json
# end

def parse_dates(params, date_class: Date)
  [params[:start], params[:finish]].map { |date| date_class.parse(date) }
end
