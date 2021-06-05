# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Representatives Index Page' do
  before :each do
  end

  describe 'happy path' do
    before :each do
      @user = User.create!(uid: '23782', username: 'testuser', token: 'kjh76sd876sd')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      # stub_request(:get, 'http://representatives')
      #         .with(
      #           headers: {
      #             'Accept' => '*/*',
      #             'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #             'User-Agent' => 'Faraday v0.9.2'
      #           }
      #         )
      #         .to_return(status: 200, body: response, headers: {})

      visit '/search'

      fill_in 'zip_code', with: '80203'
      fill_in 'city', with: 'Denver'
      fill_in 'state', with: 'CO'
      fill_in 'street_adress', with: '901 N Sherman street'
      click_button 'search'
    end

    it 'displays what it should ' do
      # expect(current_path).to eq('/representatives')
      #
      # expect(page).to have_content("representatives results for #{searched_address} ")
      # expect(page).to have_content()
      # expect(page).to have_content()
      # expect(page).to have_content()
    end
  end
end
