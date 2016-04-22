post '/votes' do
  # binding.pry
  if logged_in?
    if vote_exists?(session[:user_id], params[:votable_type], params[:votable_id])
      vote = find_vote(session[:user_id], params[:votable_type], params[:votable_id])
      vote.update_attributes(value: params[:value])
      redirect "/questions/#{params[:question_id]}"

    else
      vote = Vote.new(votable_id: params[:votable_id], value: params[:value], votable_type: params[:votable_type], user_id: session[:user_id])
      if vote.save

        #route back to the question id that it came from, in which that comment/answer originated from

        #Had to use another hidden input tag that supplied the question id. I could not find another way to carry this information between this controller and the question show page in any more logical way.

        redirect "/questions/#{params[:question_id]}"
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

