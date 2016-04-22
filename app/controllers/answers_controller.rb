get '/questions/:id/answers/new' do
  if logged_in?

  if request.xhr?
    erb :'_new_answer_form.erb'

  else

  end
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

post '/answers/best' do
  answer = Answer.find_by(id: params[:answer_id])
  if logged_in? && (session[:user_id] == params[:question].to_i)
    Answer.where(best_answer: true).each { |answer| answer.update_attribute(:best_answer, false) }
    answer.update_attribute(:best_answer, true)
    redirect "/questions/#{answer.question_id}"
    #the logged in user is also owner of the question
      #reset all 'best_answer' column values for answers belonging to the question as false
      #update the current chosen answer as 'true' for best answer
  else
    redirect "/questions/#{answer.question_id}"
  end
end
