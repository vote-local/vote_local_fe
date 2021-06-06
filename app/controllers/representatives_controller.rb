class RepresentativesController < ApplicationController
  before_action :require_current_user

  def index
    # response = Faraday.get('https://vote-local-be.herokuapp.com/api/v1/representatives')
    # data = JSON.parse(response.body, symbolize_names: true)

    @representatives = RepresentativesFacade.top_reps(params_address_to_string)
  end

  private

  def params_address_to_string
    "#{params[:street_adress]}, #{params[:city]}, #{params[:state]}, #{params[:zip_code]}"
  end
end
