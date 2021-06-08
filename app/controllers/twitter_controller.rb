class TwitterController < ApplicationController
  def get_twitter_id

    twitter_id = TwitterService.representative_twitter_id(params[:handle])

    redirect_to #something that includes twitter_id


  end

end
