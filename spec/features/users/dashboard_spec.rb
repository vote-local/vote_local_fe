# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'User Dashboard Page' do
  describe 'happy paths' do
    before :each do
      @user = User.create!(uid: '23782', username: 'testuser', token: 'kjh76sd876sd')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    xit 'displays navbar buttons' do
      visit '/dashboard'

      # save_and_open_page
      within '.navbar navbar-expand-lg navbar-light bg-light' do
        expect(page).to have_link('Dashboard')
        expect(page).to have_link('Search')
      end
    end

    it 'displays followed representatives section' do
      visit '/dashboard'

      expect(page).to have_content('Followed Representatives')
    end
  end

  describe 'sad paths ' do
    it 'dispays 404 if user is not loged in' do
      visit '/search'

      expect(page).to have_content("The page you were looking for doesn't exist (404)")
    end
  end
end
