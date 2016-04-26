post '/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    log_in(@user)
    redirect '/dashboard'
  else
    @error_message = "Invalid email or password"
    redirect '/'
  end
end

post '/signup' do
  @user = User.new(params[:user])
  if @user.encrypted_password.length < 8
    redirect 'static/404'
  end
  @user.password = params[:user][:password]
  if @user.save
    log_in(@user)
    redirect to '/profile'
  else
    @error_message =  "Invalid email or password"
    redirect '/'
  end
end

post '/logout' do
  log_out
  redirect '/'
end
