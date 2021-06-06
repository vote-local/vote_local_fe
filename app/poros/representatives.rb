class Representatives
  attr_reader :name, :party, :url, :photo_url, :office_name, :twitter_handle

  def initialize(info)
    @name = info[:attributes][:name]
    @party = info[:attributes][:party]
    @url = info[:attributes][:url]
    @photo_url = info[:attributes][:photo_url]
    @office_name = info[:attributes][:office_name]
    @twitter_handle = info[:attributes][:twitter_handle]
  end




end
