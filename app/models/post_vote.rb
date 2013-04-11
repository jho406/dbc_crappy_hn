class PostVote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :post_id, :uniqueness=>{:scope=>:user_id}

  after_create :increment_vote

  def increment_vote
    self.post.increment!(:votes)
  end
  # Remember to create a migration!
end
