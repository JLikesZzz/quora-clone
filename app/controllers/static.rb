get '/' do

  if logged_in?
    redirect "/dashboard"
  else
  erb :"static/login"
  end
end

get '/signup' do
  erb :"static/signup"
end

get '/dashboard' do
    @list_question = Question.all.order(created_at: :desc)
    erb :"static/dashboard"
end

get '/profile/:user_id' do
  @user_profile = User.find(params[:user_id])
  erb :"static/profile"
end

post '/profile/:user_id' do
  @user_profile = User.find(params[:user_id])
  redirect to "/profile/#{@user_profile.id}"
end
