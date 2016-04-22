get '/questions/index' do
  @questions = Question.all
  erb :'/questions/index'
end


get '/questions/new' do
  if request.xhr?
    erb :'/questions/_new_question_form', layout: false
  else
    erb :'/questions/new'
  end
end

post '/questions' do
  @user = User.find_by(id: session[:user_id])
  @new_question = Question.new(title: params[:title], content: params[:content], user_id: @user.id)
  if @new_question.save
    binding.pry
    redirect "/questions/#{@new_question.id}"
  else
    erb :'/questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end
