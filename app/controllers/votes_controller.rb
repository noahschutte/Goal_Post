post '/votes' do

  if logged_in?
    if vote_exists?(session[:user_id], params[:votable_type], params[:votable_id])
      vote = find_vote(session[:user_id], params[:votable_type], params[:votable_id])
      vote.update_attributes(value: params[:value])
      redirect "/questions/#{vote.votable_id}"
    else
      vote = Vote.new(votable_id: params[:votable_id], value: params[:value], votable_type: params[:votable_type], user_id: session[:user_id])
      if vote.save
        redirect "/questions/#{vote.votable_id}"
      end
    end
  else
    redirect '/login'
  end
end

# post '/answers/:id/votes' do
#   ans = Answer.find(params[:id])
#   vote = ans.votes.build(params)

#   if vote.save
#           redirect "/questions/#{vote.votable_id}"
#   else
#       redirect "/questions/#{vote.votable_id}"
#   end

# end

  #  #AJAX!!!!!!!!

