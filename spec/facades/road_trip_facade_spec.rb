require "rails_helper"

RSpec.describe RoadTripFacade do 
  describe "class methods" do 
    describe ".get_new_road_trip" do 
      it "returns a road trip object with weather data if given valid credentials" do 

        road_trip = RoadTripFacade.get_new_road_trip("Denver, CO", "Los Angeles, CA")
        
        expect(road_trip).to be_a(RoadTrip)
        expect(road_trip.origin).to eq("Denver, CO")
        expect(road_trip.destination).to eq("Los Angeles, CA")
        expect(road_trip.travel_time).to be_a(String)
        expect(road_trip.forecast).to be_a(Hash)
        expect(road_trip.forecast).to have_key(:datetime)
        expect(road_trip.forecast[:datetime]).to be_a(String)
        expect(road_trip.forecast).to have_key(:temperature)
        expect(road_trip.forecast[:temperature]).to be_a(Float)
        expect(road_trip.forecast).to have_key(:summary)
        expect(road_trip.forecast[:summary]).to be_a(String)
      end

      it "returns a road trip object with impossible route if given invalid credentials" do 
        road_trip = RoadTripFacade.get_new_road_trip("New York, NY", "London, UK")
        
        expect(road_trip).to be_a(RoadTrip)
        expect(road_trip.origin).to eq("New York, NY")
        expect(road_trip.destination).to eq("London, UK")
        expect(road_trip.travel_time).to eq("impossible route")
        expect(road_trip.forecast).to eq({})
      end
    end
  end
end