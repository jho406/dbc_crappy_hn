class CommentVote < ActiveRecord::Base
  belongs_to :comment 
  belongs_to :user

  validates :user_id, :uniqueness=>{:scope=>:comment_id}

  after_create :increment_vote

  def increment_vote
    self.comment.increment!(:votes)
  end

  #add an index in the migrations

end
