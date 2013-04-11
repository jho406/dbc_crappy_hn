
u1 = User.create(:email => 'Johny@test.com')
u2 = User.create(:email => 'Carolyn@test.com')
u3 = User.create(:email => 'Reilly@test.com')

u1.posts.create(:title => "A really great day", :body => "Post body", :url => "http://test.com")
u1.posts.create(:title => "A really great day", :body => "Post body", :url => "http://test.com")
u1.posts.create(:title => "A really great day", :body => "Post body", :url => "http://test.com")

u2.posts.create(:title => "A really great day", :body => "Post body", :url => "http://test.com")

u3.posts.create(:title => "A really great day", :body => "Post body", :url => "http://test.com")
u3.posts.create(:title => "A really great day", :body => "Post body", :url => "http://test.com")







p1 = Post.find(1)
p2 = Post.find(2)
p3 = Post.find(3)

p1.comments.create(:body => "This is comment body", :user=>u1)
p1.comments.create(:body => "This is comment body", :user=>u2)
p2.comments.create(:body => "This is comment body", :user=>u3)
p2.comments.create(:body => "This is comment body", :user=>u1)
p3.comments.create(:body => "This is comment body", :user=>u2)
p3.comments.create(:body => "This is comment body", :user=>u3)



c1 = Comment.find(1)
c2 = Comment.find(2)
c3 = Comment.find(3)
 
u1.voted_posts << p1
u1.voted_comments << c1

u2.voted_posts << p2
u2.voted_comments << c2

u3.voted_posts << p3
u3.voted_comments << c3