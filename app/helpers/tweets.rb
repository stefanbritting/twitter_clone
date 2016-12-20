helpers do
  def get_tweet(id)
    tweet = Tweet.find(id)
    tweet
  end
  # end of helper
end
