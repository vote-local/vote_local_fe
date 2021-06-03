require 'rails_helper'
RSpec.describe "User Dashboard Page" do
  before :each do
  end
  
  skip "has a button to log-out" do
    expect(page).to have_button("Log Out")
  end

  skip "has a button to search representatives by location" do
    expect(page).to have_button("Search Representatives")
  end

  skip "has representatives I followed" do 
    expect(page).to have_content("rep1")
  end
end