post '/tweet/create' do
  tweet = Tweet.new(params[:shout])
  user = get_current_user
  tweet.user_id = user.id
  tweet.save
  redirect to "/"
  # erb :"static/index"
end
get '/tweet/:id' do |id|
  @tweet_id = id
  erb :"tweet/show"
end
post '/tweet/:id/edit' do |id|
  tweet = get_tweet(id)
  tweet.tweet = params["edit_tweet"]["tweet"] unless params["edit_tweet"]["tweet"] == ""
  tweet.save
  redirect to "/tweet/#{id}"
end
post '/tweet/:id/delete' do |id|
  get_tweet(id).delete
  redirect to "/"
end
