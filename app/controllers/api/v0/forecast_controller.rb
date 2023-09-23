class Api::V0::ForecastController < ApplicationController 
  before_action :location?

  def index 
    
  end


  private 

  def location? 
    if params[:location].present? 
      @coordinates = GeocodeFacade.get_coordinates(params[:location]) 
    else 
      render json: {error: "Please provide a location."}, status: 400
    end
  end
end