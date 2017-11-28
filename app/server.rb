class App < Sinatra::Base
  configure do
    enable :sessions
    enable :cross_origin
    set :session_secret, "rental not property"
    use Rack::MethodOverride
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end
  
  options "*" do
    response.headers["Allow"] = "GET, POST, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = 
      "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end
end
