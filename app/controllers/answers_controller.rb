get '/questions/:id/answers/new' do
  if logged_in?
    @question = Question.find_by(id: params[:id])
    erb :'/answers/new'
  else
    redirect '/login'
  end
end

post '/questions/:id/answers' do
  @user = User.find_by(id: session[:user_id])
  @question = Question.find_by(id: params[:question_id])
  answer = Answer.new(content: params[:content], user_id: @user.id, question_id: @question.id)
  if answer.save
    redirect "/questions/#{@question.id}"
  else
    erb :'/answers/new'
  end
end
