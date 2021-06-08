require 'rails_helper'
RSpec.describe 'twitter service' do

  describe 'happy paths' do
    it ' returns a representatives twitter_id 1', :vcr do
      # VCR.turn_off!

      # @user = User.create!(uid: '23782', username: 'testuser', token: 'test junk')
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      twitter_name = 'jaredpolis'
      response = TwitterService.representative_twitter_id(twitter_name)

      # binding.pry

      expect(response).to eq("15361570")
    end
  end


end
