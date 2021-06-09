class RepresentativesFacade

  def self.fetch_representative_data(address)
    data ||= RepresentativesService.representatives(address)
  end

  def self.top_reps(address)
    parsed = fetch_representative_data(address)
    reps = []

    parsed[:data].each do |rep|
      reps << Representative.new(rep)
    end

    reps
  end

  def self.rep(address, api_id)
    parsed = fetch_representative_data(address)

    rep = parsed[:data].find do |rep|
      rep[:attributes][:api_id] == api_id
    end

    Representative.new(rep)
  end
end
