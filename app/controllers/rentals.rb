class App < Sinatra::Base
  get '/rentals' do
    content_type :json
    get_rentals
  end
end
