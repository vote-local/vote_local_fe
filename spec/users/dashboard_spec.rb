require 'rails_helper'
RSpec.describe "User Dashboard Page" do


  describe 'happy paths' do
    before :each do
      @user = User.create!(uid: "23782", username: "testuser", token: "kjh76sd876sd")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it 'displays navbar buttons' do
      visit '/dashboard'

      expect(page).to have_button("dashboard")
      expect(page).to have_button("search")


    end


  end



  describe 'sad paths ' do
  end

end
