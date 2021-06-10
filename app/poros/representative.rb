class Representative
  attr_reader :name, :party, :url, :photo_url, :office_name, :twitter_handle, :api_id, :zip_code

  def initialize(info)
    @name = info[:attributes][:name]
    @party = info[:attributes][:party]
    @url = info[:attributes][:url]
    @photo_url = info[:attributes][:photo_url]
    @office_name = info[:attributes][:office_name]
    @twitter_handle = info[:attributes][:twitter_handle]
    @api_id = info[:attributes][:api_id]
    @zip_code = @api_id[0..4]
  end
end
