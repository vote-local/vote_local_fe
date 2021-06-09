require 'rails_helper'
RSpec.describe 'twitter service' do
  describe 'happy paths', :vcr do
    it 'returns a representatives twitter_id 1' do
      twitter_name = 'jaredpolis'
      response = TwitterService.representative_twitter_id(twitter_name)
    
      expect(response).to eq("15361570")
    end

    skip 'returns a representatives twitter_id 1' do
      @user = User.create!(uid: '1399770258081128450', username: 'testuser', token: 'test junk')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      response = TwitterService.follow('15361570', '1399770258081128450')

      # expect(response).to eq("")
    end

    it 'returns tweets that include the representatives twitter handle' do
      search = 'jaredpolis'
      response = TwitterService.find_tweets(search)

      expect(response).to be_a(Hash)
      expect(response[:meta][:result_count]).to eq(10)
      response[:data].each do |data|
        expect(data[:text]).to be_a(String)
      end
    end
  end

  describe 'sad paths', :vcr do
    it 'returns no results if no tweets are found' do
      search = 'jiridpolis'
      response = TwitterService.find_tweets(search)
      expect(response[:meta][:result_count]).to eq(0)
    end
  end
end
