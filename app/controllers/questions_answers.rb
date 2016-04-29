

get '/questions/:question_id/answers/new' do
  @question_id = params[:question_id]
  erb :'static/questions_answers/new'
end

post '/questions/:question_id/answers' do
  question_link = params[:question_id]
  new_answer =  current_user.answers.build(params[:user])
  new_answer.question_id = question_link
  if new_answer.save
  redirect "/questions/#{question_link}"
  else
    error_message = true
  end
end
