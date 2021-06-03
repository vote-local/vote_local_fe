require 'rails_helper'

RSpec.describe "Welcome Page" do
  before :each do
    visit root_path
  end

  describe "When we visit the welcome page" do
    it "displays our projects title and a button to log into the site with twitter" do
      expect(current_path).to eq(root_path)

      expect(page).to have_content("Vote Local")
      expect(page).to have_button("Login with Twitter")
    end
  end
end
