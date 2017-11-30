require 'bcrypt'

class App < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/users/new' do
    erb(:user)
  end

  post '/users/new' do
    User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    redirect '/'
  end

  get '/users/signin' do
    erb(:signin)
  end

  post '/users/signin' do
    redirect '/'
  end

  get '/rentals/view' do
    erb(:property)
  end

  get '/rentals/create'do
    erb(:create)
  end

  post '/rentals/create' do
    Rental.create(price: params[:price], address: params[:address], image: params[:image])
    redirect('/')
  end

  get '/rentals/:id' do |id|
    content_type :json
    return 404 if Rental.get(id).nil?
    rental_to_json(id)
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
    return 404 if Rental.get(id).nil?
    start, finish = parse_dates(params)
    { available: available?(id, start, finish) }.to_json
  end


  post '/bookings/:id' do |id|
    start, finish = parse_dates(params)
    book(id, start, finish)
  end
end
