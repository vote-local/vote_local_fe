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

      expect(page).to have_field('address-line')
      expect(page).to have_field('city')
      expect(page).to have_field('state')
      expect(page).to have_field('postal-code')
      expect(page).to have_button('Submit')
    end

    it 'takes the user to the representatives index page with valid query params' do
      @user = User.create!(uid: '23782', username: 'testuser', token: 'kjh76sd876sd')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      response = File.read("./spec/fixtures/representatives_index.json")

      stub_request(:get, "https://vote-local-be.herokuapp.com/api/v1/representatives?address=901%20N%20Sherman%20street,%20Denver,%20CO%2080203").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.4.2'
          }).
        to_return(status: 200, body: response, headers: {})


      visit '/search'

      fill_in 'postal-code', with: '80203'
      fill_in 'city', with: 'Denver'
      select 'Colorado', from: "state"
      fill_in 'address-line', with: '901 N Sherman street'
      click_button 'Submit'

      expect(current_path).to eq('/representatives')
    end

    it 'takes the user to the representatives index page with valid query params' do
      @user = User.create!(uid: '23782', username: 'testuser', token: 'kjh76sd876sd')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      response = File.read("./spec/fixtures/representatives_index.json")

      stub_request(:get, "https://vote-local-be.herokuapp.com/api/v1/representatives?address=901%20N%20Sherman%20street,%20Denver,%20CO%2080203").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.4.2'
          }).
        to_return(status: 200, body: response, headers: {})


      visit '/search'

      fill_in 'postal-code', with: '80203'
      fill_in 'city', with: 'Denver'
      select 'Colorado', from: "state"
      fill_in 'address-line', with: '901 N Sherman street'
      click_button 'Submit'

      expect(current_path).to eq('/representatives')
    end

    xit 'returns an error and redirects to search if user does not select city and/or zip code', :vcr do
      @user = User.create!(uid: '23782', username: 'testuser', token: 'kjh76sd876sd')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/search'

      fill_in 'postal-code', with: ''
      fill_in 'city', with: ''
      select 'Colorado', from: "state"
      fill_in 'address-line', with: ''
      click_button 'Submit'
      expect(page).to have_content("Please fill out this field")

      expect(current_path).to eq('/search')
    end
  end

  describe 'sad paths' do
    it 'dispays 404 if user is not logged in' do
      visit '/search'

      expect(page).to have_content("The page you were looking for doesn't exist (404)")
    end
  end
end
