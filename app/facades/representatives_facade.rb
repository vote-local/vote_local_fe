class RepresentativesFacade
  def self.top_reps(address)
    parsed = RepresentativesService.representatives(address)
    reps = []

    parsed[:data].each do |rep|
      reps << Representative.new(rep)
    end

    reps
  end

  def self.rep(address, api_id)
    parsed = RepresentativesService.representatives(address)

    rep = parsed[:data].find do |rep|
      rep[:attributes][:api_id] == api_id
    end

    Representative.new(rep)
  end
end
