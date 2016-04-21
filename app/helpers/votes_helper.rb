
def vote_exists?(user_id, votable_type, votable_id)
  return true if Vote.where(user_id: user_id, votable_type: votable_type, votable_id: votable_id).first

  false

end


def find_vote(user_id, votable_type, votable_id)
  Vote.where(user_id: user_id, votable_type: votable_type, votable_id: votable_id).first
end



