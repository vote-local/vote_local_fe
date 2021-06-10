require 'rails_helper'
RSpec.describe 'User Dashboard Page', :vcr do
  describe 'happy paths' do
    before :each do
      @user = User.create!(uid: '23782', username: 'testuser', token: 'kjh76sd876sd')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      # response = File.read("./spec/fixtures/rep_tweets.json")
      #
      # stub_request(:get, "https://api.twitter.com/2/users/by/username/MayorHancock").
      #   with(
      #     headers: {
      #    'Accept'=>'*/*',
      #    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #    'User-Agent'=>'Faraday v1.4.2'
      #     }).
      #   to_return(status: 200, body: response, headers: {})
    end

    xit 'displays navbar buttons' do
      visit '/dashboard'


      expect(page).to have_link(href: "/dashboard")
      expect(page).to have_link('Dashboard')
      expect(page).to have_link('Search')
    end

    it 'displays followed representatives section a message if not following anyone' do
      visit '/dashboard'

      expect(page).to have_content('Followed Representatives')
      expect(page).to have_content('Currently not following any Representatives')
    end

    it 'displays the names of followed reps' do
      twitter_rep = TwitterRep.create!(name: "testname",
                                 api_id: "testname21353252",
                                twitter: "MayorHancock",
                                   user: @user)

      twitter_rep2 = TwitterRep.create!(name: "test2name",
                                  api_id: "testnameasdasdasdasf",
                                 twitter: "testname2twitter",
                                    user: @user)

      visit '/dashboard'

      expect(page).to have_content(twitter_rep.name)
      expect(page).to have_content(twitter_rep2.name)
    end

    it "displays 10 of the the last 10 tweets of a followed representative" do
      twitter_rep = TwitterRep.create!(name: "testuser",
                                 api_id: "testname21353252",
                                twitter: "MayorHancock",
                                   user: @user)

      twitter_rep2 = TwitterRep.create!(name: "test2name",
                                  api_id: "testnameasdasdasdasf",
                                 twitter: "testname2twitter",
                                    user: @user)

      visit '/dashboard'

      expect(page).to have_content("Big news, Denver! 70% of our eligible residents age 12 and older have received at least one dose of the COVID-19 vaccine. This puts us ahead of the @POTUS July 4th deadline. Congrats Mile High City! If you haven’t been vaccinated - you still can! 💉 https://t.co/htaY9a7z3p")
      expect(page).to have_content("There's a new fixed public restroom on Champa Street just off the 16th Street Mall! Providing residents and visitors access to a comfortable, clean restroom meets a basic and universal human need and we’re proud to deliver this facility to the people of Denver. https://t.co/almjlGarsy")
    end
  end

  describe 'sad paths ' do

    it 'dispays 404 if user is not loged in' do
      visit '/search'

      expect(page).to have_content("The page you were looking for doesn't exist (404)")
    end

    it "displays 10 of the the last 10 tweets of votelocalturing's tweets if twitter handle is invalid" do
      user = User.create!(uid: '23782', username: 'testuser', token: 'kjh76sd876sd')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      twitter_rep = TwitterRep.create!(name: "testuser",
                                 api_id: "testname21353252",
                                twitter: "not found",
                                   user: user)

      twitter_rep2 = TwitterRep.create!(name: "test2name",
                                  api_id: "testnameasdasdasdasf",
                                 twitter: "testname2twitter",
                                    user: user)

      visit '/dashboard'

      expect(page).to have_content("Project almost done!")
      # expect(page).to have_content("There's a new fixed public restroom on Champa Street just off the 16th Street Mall! Providing residents and visitors access to a comfortable, clean restroom meets a basic and universal human need and we’re proud to deliver this facility to the people of Denver. https://t.co/almjlGarsy")
    end
  end
end
