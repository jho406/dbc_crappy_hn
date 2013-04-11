class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :comment_votes

  after_create :increment_comment_count

  def increment_comment_count
    self.post.increment(:comment_count)
  end
  #validates :body, :presence => true

end
