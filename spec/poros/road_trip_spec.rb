require "rails_helper"

RSpec.describe RoadTrip do
  it "exists w/ attributes" do 
    trip_data = {
      "origin": "Denver, CO",
      "destination": "Los Angeles, CA",
    }

    road_trip = RoadTripFacade.get_new_road_trip(trip_data[:origin], trip_data[:destination])

    expect(road_trip).to be_a RoadTrip
    expect(road_trip.id).to eq("null")
    expect(road_trip.type).to eq("roadtrip")
    expect(road_trip.origin).to eq("Denver, CO")
    expect(road_trip.destination).to eq("Los Angeles, CA")
    expect(road_trip.travel_time).to be_a String
    expect(road_trip.forecast).to be_a Hash
    expect(road_trip.forecast).to have_key(:datetime)
    expect(road_trip.forecast).to have_key(:summary)
    expect(road_trip.forecast).to have_key(:temperature)
  end
end