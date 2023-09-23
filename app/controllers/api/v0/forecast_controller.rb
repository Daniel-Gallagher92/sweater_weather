class Api::V0::ForecastController < ApplicationController 

  def index
    if params[:location].nil? || params[:location].empty?
      render json: {error: "Please provide a location."}, status: 400
    else
      forecast = ForecastFacade.get_forecast(params[:location])
      render json: ForecastSerializer.new(forecast)
    end
  end
end