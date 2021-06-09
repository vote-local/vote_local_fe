class TwitterController < ApplicationController
  def get_twitter_id

    twitter_id = TwitterService.representative_twitter_id(params[:handle])

    # binding.pry
    user_id = @current_user.uid

    TwitterService.follow(twitter_id, user_id)
  end

  def get_tweets
    relevant_tweets = TwitterService.find_tweets(params[:handle)
  end

end
