get '/' do
  erb :"static/index"
end

post '/signup'do
  user = User.new(params[:user])
  if user.save
    puts "It's saved!"
  else
    puts "Invalid email or password"
  end

end
