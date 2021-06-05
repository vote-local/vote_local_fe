# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(uid: auth_hash[:uid]) do |user|
      user.uid = auth_hash[:uid]
      user.username = auth_hash[:info][:nickname]
      user.token = auth_hash[:credentials][:token]
      user.save
    end

    session[:user_id] = user.id

    redirect_to '/dashboard'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
