# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :require_current_user

  def show
  end

  def create
    twitter_rep = TwitterRep.create!(name: params[:name],
                               api_id: params[:api_id],
                              twitter: params[:twitter],
                                 user: current_user)

    redirect_to dashboard_path
  end

  private

  def rep_params
    params.permit(:name, :api_id, :twitter)
  end
end
