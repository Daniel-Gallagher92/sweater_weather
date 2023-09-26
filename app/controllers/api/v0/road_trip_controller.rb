class Api::V0::RoadTripController < ApplicationController
  def create
    begin 
      validation
      road_trip = RoadTripFacade.get_new_road_trip(params[:road_trip][:origin], params[:road_trip][:destination])
      render json: RoadTripSerializer.new(road_trip), status: 200
    rescue StandardError => e
      render json: { error: "Invalid credentials" }, status: 401
    end
  end

  private 

  def validation
    user = User.find_by(api_key: params[:api_key])
    raise "Invalid credentials" if user.nil? || user.api_key != params[:api_key]
    user
  end
end