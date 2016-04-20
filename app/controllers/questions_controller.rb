get '/question/index' do
  @questions = Question.all
  erb :'questions/index'
end

get '/question/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end
