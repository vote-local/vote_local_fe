class TwitterController < ApplicationController
  def get_twitter_id
    @twitter_id = TwitterService.representative_twitter_id(params[:handle])
  end
  
  def recent_rep_tweets
    @twitter_id = TwitterService.representative_twitter_id(params[:handle])
    representative_tweets = TwitterService.rep_tweets(@twitter_id)
  end
end
