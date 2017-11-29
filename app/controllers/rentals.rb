class App < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/rental/:id' do |id|
    content_type :json
    Rental.get(id).to_json || halt(404)
  end

  get '/rental/view' do
    erb(:property)
  end

  get '/rentals' do
    content_type :json
    rentals_to_json
  end

  get '/bookings' do
    content_type :json
    bookings_to_json
  end

  get '/bookings/validate/:id' do |id|
    content_type :json
    start, finish = parse_dates(params)
    { available: available?(id, start, finish) }.to_json
  end

  post '/bookings/:id' do |id|
    start, finish = parse_dates(params)
    halt(book(id, start, finish))
  end
end
