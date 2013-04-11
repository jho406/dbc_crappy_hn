class User < ActiveRecord::Base  
  has_many :comments
  has_many :posts
  has_many :comment_votes
  has_many :post_votes


  has_many :voted_comments, :through => :comment_votes, :source=> :comment
  has_many :voted_posts, :through => :post_votes, :source=> :post

  validates :email, :presence => true
  validates :email, :uniqueness => true

  # has_many :posts, :through=>:post_votes

end
