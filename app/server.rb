class App < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, "rental not property"
    use Rack::MethodOverride
  end
end
