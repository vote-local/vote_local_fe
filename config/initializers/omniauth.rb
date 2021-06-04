Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['api_key'], ENV['api_secret']
end
