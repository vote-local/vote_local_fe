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
    rescue NoMethodError
      nil
  end

  def self.rep_tweets(rep_id)
    response = conn.get("users/#{rep_id}/tweets")
    result = JSON.parse(response.body, symbolize_names: true)
  end
end
