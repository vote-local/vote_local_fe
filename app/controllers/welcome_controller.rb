class WelcomeController < ApplicationController
  before_action :disable_nav

  def index; end

  private
  def disable_nav
    @disable_nav = true
  end
end
