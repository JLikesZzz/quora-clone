get '/questions' do
  erb :'static/questions/index'
end

get '/questions/new' do
  erb :'static/questions/new'
end

post '/questions' do
  erb :'static/questions/create'
end

get '/questions/1' do
  erb :'static/questions/show'
end

get '/questions/1/edit' do
  erb :'static/questions/edit'
end

put '/questions/1' do
  erb :'static/questions/update'
end

delete '/questions/1' do
  erb :'static/questions/destroy'
end
