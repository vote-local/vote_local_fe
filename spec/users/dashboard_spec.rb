require 'rails_helper'
RSpec.describe "User Dashboard Page" do
  before :each do
  end
  
  skip "has a button to log-out" do
    expect(page).to have_button("log Out")
  end

  skip "has a button to search" do
    expect(page).to have_button("Search Elections")
  end

  skip "has elections I followed" do 

  end
end