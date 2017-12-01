require 'bcrypt'
require 'sinatra/flash'

class App < Sinatra::Base

  register Sinatra::Flash
  use Rack::MethodOverride

get '/users/new' do
  erb(:user)
end

post '/users/new' do
  user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/users/new'
    end
end

get '/users/signin' do
  erb(:signin)
end

post '/users/signin' do
  current_user = User.first(email: params[:email])
    if current_user && BCrypt::Password.new(current_user.hashed_password) == params[:password]
      session[:user_id] = current_user.id
      redirect '/'
    else
      flash.now[:notice] = "Password or email not correct"
      erb(:signin)
    end
end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:exit] = 'goodbye!'
    redirect '/'
  end


end
