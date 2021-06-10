class TwitterFacade

  def self.representative_tweets(twitter_handle)
    if twitter_handle == nil || twitter_handle == 'not found'
      tweets = TwitterService.rep_tweets('1399770258081128450')
    else
      twitter_id = TwitterService.representative_twitter_id(twitter_handle)
      tweets = TwitterService.rep_tweets(twitter_id)
    end
    # if twitter_id !=nil
    #   x = TwitterService.rep_tweets(twitter_id)
    # else
    #   x = {"data": []}
    # end
    #
    # return x
  end
end
