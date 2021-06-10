# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :require_current_user

  def show
    if !current_user.twitter_reps.empty?
      twt_handle = current_user.twitter_reps.first.twitter
      # twitter_id = TwitterService.representative_twitter_id(twt_handle)
      # @representative_tweets = TwitterService.rep_tweets(twitter_id)
      @representative_tweets = TwitterFacade.representative_tweets(twt_handle)
    end
  end

  def create
    twitter_rep = TwitterRep.create!(name: params[:name],
                               api_id: params[:api_id],
                              twitter: params[:twitter],
                                 user: current_user)

    redirect_to dashboard_path
  end

  def destroy
    twitter_rep = TwitterRep.find_by(api_id: params[:api_id])
    twitter_rep.destroy
    redirect_to dashboard_path
    
  end

  private

  def rep_params
    params.permit(:name, :api_id, :twitter)
  end
end
