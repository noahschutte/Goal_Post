def logged_in?
  session[:user_id] && User.find_by(id: session[:user_id] )
end

def required_logged_in
  redirect "/" unless logged_in?
end
