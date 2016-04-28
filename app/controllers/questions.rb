get '/questions' do
  @question = Question.all
  erb :'static/questions/index'
  #display a list of question
end
# action='/user/<%= @user.id %>/question/<%=question.id%>/answer/new'

get '/questions/new' do
  erb :'static/questions/new'
  #return an HTML form for creating a new question
end

post '/questions' do
  # erb :'static/questions/create'
  #create a new questions
  new_question = current_user.questions.build(params[:user])
  if new_question.save
    redirect "/questions/#{new_question.id}"
  else
    @error_message = true
  end
end

get '/questions/:question_id' do
  # access_question(params[:question_id])
  @user_question_show = Question.find(params[:question_id])
  @answers = Answer.where(question_id: params[:question_id])
  # byebug
  erb :'static/questions/show'
  #display a specific question
end

get '/questions/:question_id/edit' do
  @edit_url = "/questions/#{params[:question_id]}"
  erb :'static/questions/edit'
  #return an HTML form for editing a question
end

post '/questions/:question_id/edit' do
  @user_question_edit = Question.find(params[:question_id])
  @user_question_edit.question_title = params[:question_title]
  @user_question_edit.question_desc = params[:question_desc]
  if @user_question_edit.save
    redirect "/questions/#{@user_question_edit.id}"
  else
    @error_message = true
  end
  # redirect '/questions'
  #update a specific question
end

delete '/questions/:question_id' do
  @question_delete = Question.find(params[:question_id])
  @question_delete.destroy
  redirect "/profile/#{current_user.id}"
  #delete a specific question
end
