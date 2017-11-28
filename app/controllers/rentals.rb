class App < Sinatra::Base
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
    available?(id, start, finish)
  end

  post '/bookings/:id' do |id|
    start, finish = parse_dates(params)
    book(id, start, finish)
    200
  end
end
