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
    response = conn.post("https://api.twitter.com/2/users/#{user_id}/following") do |require|
      # require.params['id'] = user_id
      require.headers['Consumer Key'] = "#{ENV['api_key']}"
      require.headers['Consumer Secret'] = "#{ENV['api_secret']}"
      require.headers['Access Token'] = "#{ENV['twitter_access_token']}"
      require.headers['Token Secret'] = "#{ENV['twitter_access_secret_token']}"
      require.body = "{target_user_id: #{twitter_id}}"
    end
    # JSON.parse(response.body, symbolize_names: true)
  end


end


# https://api.twitter.com/2/users/by/username/:username
