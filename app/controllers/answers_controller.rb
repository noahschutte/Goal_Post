get '/questions/:id/answers/new' do
  @question = Question.find_by(id: params[:id])
  if logged_in?
    redirect "/questions/#{@question.id}"
  else
    redirect '/login'
  end
end

post '/questions/:id/answers' do
  @user = User.find_by(id: session[:user_id])
  @question = Question.find_by(id: params[:question_id])
  answer = Answer.new(content: params[:content], user_id: @user.id, question_id: @question.id)

#   if answer.save
#     redirect "/questions/#{@question.id}"
#   else
#     erb :'/answers/new'
#   end
end

post '/answers/best' do
  if logged_in?
    #the logged in user is also owner of the question
      #reset all 'best_answer' column values for answers belonging to the question as false
      #update the current chosen answer as 'true' for best answer
  else
    redirect '/login'
  end
end
