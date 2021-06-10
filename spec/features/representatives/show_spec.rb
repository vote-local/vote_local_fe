require 'rails_helper'

RSpec.describe 'Election Show Page' do
  before :each  do
    @user = User.create!(uid: '23782', username: 'testuser', token: 'kjh76sd876sd')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    response = File.read("./spec/fixtures/representatives_index.json")

    stub_request(:get, "https://vote-local-be.herokuapp.com/api/v1/representatives?address=901%20N%20Sherman%20Street,%20Denver,%20CO%2080203").
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
    fill_in 'address-line', with: '901 N Sherman Street'
    click_button 'Submit'

    click_link("Michael Hancock")
    expect(current_path).to eq('/representatives/80202MichaelHancock')
  end

  it 'displays information about the representative' do
    expect(page).to have_content("Michael Hancock")
    expect(page).to have_content("Denver Mayor")
    expect(page.find('.rep-photo')['src']).to have_content('https://www.denvergov.org/content/dam/denvergov/Portals/728/images/Mayor-Hancock-Web.jpg')
    expect(page).to have_content("Party Affiliation")
    expect(page).to have_content("Nonpartisan")
    expect(page).to have_content("Twitter")
    expect(page).to have_link(href: "https://www.denvergov.org/content/denvergov/en/mayors-office.html")
  end

  it 'allows user to follow a representative and redirects to dashboard displaying reps name', :vcr do
    click_button("Follow")

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Michael Hancock")
  end
end
