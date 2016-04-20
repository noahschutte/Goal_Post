get '/login' do
  @user = User.find_by(id: session[:user_id])
  erb :'/sessions/new'
end

post '/login' do
  if @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/sessions/new'
    end
  else
    redirect '/sessions/new'
  end
end

delete '/logout' do
  session.clear
  redirect '/'
end
