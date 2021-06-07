class RepresentativesFacade
  def self.top_reps(address)
    data = RepresentativesService.representatives(address)
    reps = []


    reps = data[:data].map do |rep|
      Representatives.new(rep)
    end

    reps
  end
end
