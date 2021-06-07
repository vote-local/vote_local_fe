class TwitterService
  def self.conn
    Faraday.new('https://api.twitter.com/1.1/')
    faraday.headers['Authorization'] = "#{ENV['omniauth.auth']}"
  end

  def self.search_tweets(handle)
    response = conn.get("friendships/create.json") do |req|
      req.params['user_id'] = handle
    end 
    JSON.parse(response.body, symbolize_names: true)
  end
end
