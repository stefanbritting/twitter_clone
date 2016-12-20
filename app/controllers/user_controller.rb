enable :session
get '/user/new' do
  erb :"/user/new"
end

post '/user/create' do
  "Hello World"
  user = User.new(params[:user])
    # creating password_hash with Bcrypt
  user.password = user.password_digest
  user.save
  redirect to "/"
  # erb :"static/index"
end

get '/user/sign_in' do
  erb :"/user/sign_in"
end

post '/user/sign_in' do
  user = User.find_by(email: params[:user][:email])
  if user.authenticate(params[:user][:password])
    session["user_id"] = user.id
    redirect to "/"
    # erb :"static/index"
  else
    erb :"/user/sign_in"
  end
end

post '/user/sign_out' do
  session["user_id"] = nil
  erb :"static/index"
end

get '/user/:id' do |id|
  @user_id = id
  erb :"user/show"
end

get '/user/:id/edit' do |id|
  @user_id = id
  erb :"user/edit"
end
post '/user/:id/edit' do |id|
  user = User.find(id)
  user.update!(params[:edit_profile])
  redirect to "/user/#{id}"
end
      # user with id 5 follows user with id 2
post "/user/:id_follower/follows/:id_followed" do |id_follower, id_followed|
  follower = Follower.new(follower_id: id_follower, followed_id: id_followed)
  follower.save
  redirect to "/"
  # erb :"static/index"
end
