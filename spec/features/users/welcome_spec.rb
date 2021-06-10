require 'rails_helper'

RSpec.describe 'Welcome Page' do
  before :each do
    visit '/'

    @user = User.create!(uid: '23782', username: 'testuser', token: 'kjh76sd876sd')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
                                                                   provider: 'twitter',
                                                                   uid: '123545',
                                                                   info: { nickname: 'johnqpublic' },
                                                                   credentials: {
                                                                     token: 'a1b2c3d4...',
                                                                     secret: 'abcdef1234'
                                                                   }
                                                                 })
    @auth_hash = OmniAuth.config.mock_auth[:twitter]
  end

  describe 'When we visit the welcome page' do
    it 'displays our projects title and a button to log into the site with twitter' do
      expect(current_path).to eq('/')

      expect(page).to have_content('Vote Local')
      expect(page).to have_button('Login with Twitter')
    end

    describe 'when the twitter login button is clicked ' do
      it 'creates the user using omniauth hash info', :vcr do
        click_on 'Login with Twitter'

        user = User.find_by(uid: @auth_hash[:uid])

        expect(user).to_not eq(nil)
        expect(user.username).to eq(@auth_hash[:info][:nickname])
      end

      it 'redirects the user to thier personalized dashboard and displays their username', :vcr do
        click_on 'Login with Twitter'

        expect(current_path).to eq('/dashboard')
        expect(page).to have_content("Welcome to Vote Local testuser!")
      end
    end
  end
end
