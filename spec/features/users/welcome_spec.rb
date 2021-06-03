require 'rails_helper'
RSpec.describe "Welcome Page" do
  before :each do
    visit root_path
  end

  skip "has a welcome message" do
    expect(page).to have_content("Welcome to Vote Local")
  end
end