class TwitterFacade

  def self.representative_tweets(twitter_handle)
    twitter_id = TwitterService.representative_twitter_id(twitter_handle)
    if twitter_id !=nil
      x = TwitterService.rep_tweets(twitter_id)
    else
      x = {"data": []}
    end
    return x
  end
end
