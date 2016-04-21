def vote_exists?(user_id, votable_type, votable_id)
  Vote.exists?(user_id: user_id, votable_type: votable_type, votable_id: votable_id)
end

def find_vote(user_id, votable_type, votable_id)
  Vote.where(user_id: user_id, votable_type: votable_type, votable_id: votable_id).first
end



