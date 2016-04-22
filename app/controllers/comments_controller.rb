get '/questions/:id/comments/new' do
  @question = Question.find_by(id: params[:id])
  if logged_in?
    if request.xhr?
      erb :'/comments/_new_question_comment', layout: false
    else
    erb :'/comments/new'
    end
  else
    redirect '/login'
  end
end

post '/questions/:id/comments' do
  @user = User.find_by(id: session[:user_id])
  @question = Question.find_by(id: params[:question_id])
  comment = Comment.new(user_id: @user.id, commentable_id: @question.id, commentable_type: Question, content: params[:content])
  if comment.save
    redirect "/questions/#{@question.id}"
  else
    erb :'/comments/new'
  end
end

get '/answers/:id/comments/new' do
  if logged_in?
    @answer = Answer.find_by(id: params[:id])
    erb :'/comments/new_answer_comment'
  else
    redirect '/login'
  end
end

post '/answers/:id/comments' do
  @user = User.find_by(id: session[:user_id])
  @answer = Answer.find_by(id: params[:answer_id])
  comment = Comment.new(user_id: @user.id, commentable_id: @answer.id, commentable_type: Answer, content: params[:content])
  if comment.save
    redirect "/questions/#{@answer.question.id}"
  else
    erb :'/comments/new_answer_comment'
  end
end
