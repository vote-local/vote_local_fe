class TwitterService
  def self.conn
    Faraday.new('https://api.twitter.com/2/') do |faraday|
      faraday.headers['Authorization'] = "Bearer #{ENV['twitter_bearer_token']}"
    end
  end

  def self.representative_twitter_id(handle)
    response = conn.get("users/by/username/#{handle}")
    result = JSON.parse(response.body, symbolize_names: true)
    id = result[:data][:id]
  end

  def self.follow(twitter_id, user_id)
    # binding.pry
    response = conn.post("users/#{user_id}/following") do |require|
      # require.params['id'] = user_id
      require.headers['content_type'] = 'application/json'
      require.headers['oauth_consumer_key'] = "#{ENV['api_key']}"
      require.headers['consumer_secret'] = "#{ENV['api_secret']}"
      require.headers['oauth_token'] = "#{ENV['twitter_access_token']}"
      require.headers['oauth_token_secret'] = "#{ENV['twitter_access_secret_token']}"
      require.headers['oauth_version'] = "1.0"
      require.headers['oauth_signature_method'] = "HMAC-SHA1"
      require.body = "{target_user_id: #{twitter_id}}"
    end

    # JSON.parse(response.body, symbolize_names: true)
  end

# oauth_consumer_key="z8C8OPOi1sRHGQk6SqwmaC9cw",
  # oauth_token="1399770258081128450-qm2TDGXNmMsYiW7MUBcr6WOpgLGXii",
  # oauth_signature_method="HMAC-SHA1",
  # oauth_timestamp="1623289899",
  # oauth_nonce="Oopo35Z5okw",
  # oauth_version="1.0",
  # oauth_signature="Y6Go080n%2Bxk%2FApzmBNVQaeuDicE%3D"

  # def self.find_tweets(rep_name)
  #   response = conn.get("tweets/search/recent") do |req|
  #   req.params['query'] = rep_name
  #   end
  #   result = JSON.parse(response.body, symbolize_names: true)
  # end

  def self.rep_tweets(rep_id)
    response = conn.get("users/#{rep_id}/tweets")
    result = JSON.parse(response.body, symbolize_names: true)
  end
end
