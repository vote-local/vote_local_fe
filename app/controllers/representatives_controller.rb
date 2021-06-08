class RepresentativesController < ApplicationController
  before_action :require_current_user

  def index
    @address = params_address_to_string
    @representatives = RepresentativesFacade.top_reps(@address)
  end

  def show
    @representative = RepresentativesFacade.rep(params[:address], params[:id].gsub(/[!@%&".]/,''))
  end

  private

  def params_address_to_string
    address = ""
    address += "#{params["address-line"]}" if params['address-line'] != ""
    address += ", #{params[:city]}"
    address += ", #{params[:state]}"
    address += " #{params["postal-code"]}" if params['postal-code'] != ""

    return address
  end
end
