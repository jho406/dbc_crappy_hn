
get '/news' do
  # Look in app/views/index.erb
  @posts = Post.all
  # Need to sort posts by most recent time here.
  erb :index
end

get '/' do
  redirect to('/news')
end

get '/item' do
  @post = Post.find(params[:id])
  @comments = @post.comments.all
  erb :item
end

get '/user' do
  @user = User.find(params[:id])
  erb :user
end

get '/submitted' do
  @user= User.find(params[:id])
  @submissions = @user.posts
  erb :submissions
end

get '/comments' do
  @user= User.find(params[:id])
  @comments = @user.comments
  erb :comments
end

get '/newslogin' do
  erb :login
end

post '/newslogin' do
  @user = User.find_by_email(params[:user][:email])
  redirect back unless @user
  session[:user_id] = @user.id
  redirect to("/news")
end

get '/logout' do
  session.delete(:user_id)
  redirect to("/news")
end

get '/submit' do
  if logged_in?
    erb :new_post  
  else
    erb :create_login
  end
end

post '/login/new' do
  @user = User.create(:email=>params[:email])
  session[:user_id] = @user.id
  redirect back
end

post '/submit' do 
  redirect to("/newslogin") unless logged_in?
  current_user.posts.create(params[:post])
  redirect to("/news")
end

get '/edit' do
  @post = Post.find_by_id(params[:id])
  erb :edit_post
end

post '/edit' do
  post_id = params[:id]
  post = Post.find_by_id(post_id)
  post.update_attributes(params[:post])
  redirect to("/item?id=#{post_id}")
end

post "/post/:id/comments" do
  post = Post.find(params[:id])
  post.comments.create(:user=>current_user, :body=>params[:body])
  redirect back
end

#todo:change this to Put
get "/post/:id/upvote" do
  post = Post.find(params[:id])
  PostVote.create(:user=> current_user, :post=> post)
  redirect back
end

get "/comment/:id/upvote" do
  comment = Comment.find(params[:id])
  CommentVote.create(:user=> current_user, :comment=> comment)
  redirect back
end

















