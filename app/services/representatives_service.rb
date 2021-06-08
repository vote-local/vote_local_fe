class RepresentativesService
  def self.conn
    Faraday.new('https://vote-local-be.herokuapp.com/api/v1/')
  end

  def self.representatives(address)
    response = conn.get("representatives") do |req|
      req.params['address'] = address
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
