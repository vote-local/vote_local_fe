# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'User search Page' do
  before :each do
  end

  describe 'happy paths' do
    it 'displays a form to enter your address' do
      @user = User.create!(uid: '23782', username: 'testuser', token: 'kjh76sd876sd')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/search'

      expect(page).to have_content('Please enter your address to search for current representatives')

      expect(page).to have_field('street_adress')
      expect(page).to have_field('city')
      expect(page).to have_field('state')
      expect(page).to have_field('zip_code')
      expect(page).to have_button('search')
    end

    it 'takes the user to the representatives index page with valid query params' do
      VCR.turn_off!
      @user = User.create!(uid: '23782', username: 'testuser', token: 'kjh76sd876sd')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      response = File.read("./spec/fixtures/representatives_index.json")

      stub_request(:get, "https://vote-local-be.herokuapp.com/api/v1/representatives?901%2BN%2BSherman%2Bstreet,%2BDenver,%2BCO%2B80203").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.4.2'
          }).
        to_return(status: 200, body: response, headers: {})


      visit '/search'

      fill_in 'zip_code', with: '80203'
      fill_in 'city', with: 'Denver'
      select 'Colorado', from: "State"
      fill_in 'street_adress', with: '901 N Sherman street'
      click_button 'search'

      expect(current_path).to eq('/representatives')
    end
  end

  describe 'sad paths' do
    it 'dispays 404 if user is not loged in' do
      visit '/search'

      expect(page).to have_content("The page you were looking for doesn't exist (404)")
    end
  end
end
