class RepresentativesFacade
  def self.top_reps(address)
    data = RepresentativesService.representatives(address)
    reps = []

    binding.pry

    data.each do |rep|
      reps << Representative.new(rep)
    end

    reps
  end
end
