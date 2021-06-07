class RepresentativesController < ApplicationController
  before_action :require_current_user

  def index
    @address = params_address_to_string
    @representatives = RepresentativesFacade.top_reps(@address)
  end

  def show
    @representatives = RepresentativesFacade.rep(@address, params[:api_id])
  end

  private

  def params_address_to_string
    address = ""
    address += "#{params[:street_address]}" if params[:street_address] != ""
    address += ", #{params[:city]}" if params[:city]
    address += ", #{params[:state]}" if params[:state]
    address += " #{params[:zip_code]}" if params[:zip_code] != ""

    return address
  end
end
