get '/answers' do
  @answers = Answer.all
  erb :'static/answers/index'
  #display a list of answer
end

get '/answers/new' do
  erb :'static/answers/new'
  #return an HTML form for creating a new answer
end

post '/answers' do
  # erb :'static/answers/create'
  #create a new answer
  new_answer = current_user.answers.build(params[:user])
  if new_answer.save
  redirect "/answers/#{new_answer.id}"
  else
    error_message = true
  end
end

get '/answers/:answer_id' do
  @user_answer_show = Answer.find(params[:answer_id])
  erb :'static/answers/show'
  #display a specific answer
end

get '/answers/:answer_id/edit' do
  @edit_answer_url = "/answers/#{params[:answer_id]}"
  erb :'static/answers/edit'
  #return an HTML form for editing a answer
end

put '/answers/:answer_id' do
  @user_answer_edit = Answer.find(params[:answer_id])
  @user_answer_edit.answer_content = params[:answer_content]
  if @user_answer_edit.save
    redirect "/questions/#{@user_answer_edit.question_id}"
  else
    @error_message = true
  end
  # erb :'static/answers/update'
  #update a specific answer
  redirect '/answers'
end

delete '/answers/:answer_id' do
  @answer_delete = Answer.find(params[:answer_id])
  back_to_question_using_id = @answer_delete.question_id
  @answer_delete.destroy
  # erb :'static/answers/destroy'
  #delete a specific answer
  redirect "/questions/#{back_to_question_using_id}"
end
