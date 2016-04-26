require 'byebug'

get '/' do

  if logged_in?
    redirect "/dashboard"
  else
  erb :"static/index"
  end
end

get '/signup' do
  erb :"static/signup"
end

get '/dashboard' do
    erb :"static/dashboard"
end

get '/profile' do
  erb :"static/profile"
end
