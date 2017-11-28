class App < Sinatra::Base
  before { content_type :json }

  get '/rentals' do
    rentals_to_json
  end

  get '/bookings' do
    bookings_to_json
  end

  get '/bookings/validate/:id' do |id|
    start, finish = parse_dates(params)
    available?(id, start, finish)
  end

  post '/bookings/:id' do |id|
    start, finish = parse_dates(params)
    book(id, start, finish) ? 200 : 402
  end
end
