require 'rails_helper'

RSpec.describe 'Representatives Index Page' do
  before :each do
  end

  describe 'happy path' do
    before :each  do
      VCR.turn_off!
      @user = User.create!(uid: '23782', username: 'testuser', token: 'kjh76sd876sd')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      response = File.read("./spec/fixtures/representatives_index.json")

      stub_request(:get, "https://vote-local-be.herokuapp.com/api/v1/representatives?901%2BN%2BSherman%2BStreet,%2BDenver,%2BCO%2B80203").
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
      fill_in 'street_address', with: '901 N Sherman Street'
      click_button 'search'
    end

    it 'displays searched address and rep name and office', :vcr do
      expect(current_path).to eq('/representatives')

      expect(page).to have_content("representative results for 901 N Sherman Street, Denver, CO 80203")
      expect(page).to have_content("Jared Polis Governor of Colorado")
      expect(page).to have_content("Dianne Primavera Lieutenant Governor of Colorado")
    end

    xit "displays each rep as a link to their respective show page" do

    end
  end
end
