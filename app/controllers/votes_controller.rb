post '/votes' do

  if logged_in?

    if vote_exists?(session[:user_id], params[:votable_type], params[:question_id])
      vote = find_vote(session[:user_id], params[:votable_type], params[:question_id])
      vote.update_attributes(value: params[:value])
      redirect '/'
    else
      vote = Vote.new(votable_id: params[:question_id], value: params[:value], votable_type: params[:votable_type], user_id: session[:user_id])
      if vote.save
        redirect '/'
      end
    end

  else
    redirect '/login'

  end
end



  #     if vote.save
  #       redirect '/'
  #  #AJAX!!!!!!!!
  #     end
  #   else
  #   redirect '/login'
  # end
