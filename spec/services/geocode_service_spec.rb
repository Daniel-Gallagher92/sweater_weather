require "rails_helper"

RSpec.describe GeocodeService do 
  describe "class methods" do 
    describe ".get_coordinates" do 
      it "can return coordinates for a city" do 
        location_service = GeocodeService.get_coordinates("denver,co")
        expect(location_service).to be_a(Hash)
        expect(location_service[:results]).to be_an(Array) 

        location = location_service[:results].first 
        expect(location[:providedLocation]).to be_a(Hash)
        expect(location[:providedLocation][:location]).to eq("denver,co")

        expect(location[:locations]).to be_an(Array)
        expect(location[:locations].first).to be_a(Hash)
        expect(location[:locations].first[:latLng]).to be_a(Hash)
        expect(location[:locations].first[:latLng][:lat]).to be_a(Float)
        expect(location[:locations].first[:latLng][:lng]).to be_a(Float)
        expect(location[:locations].first[:latLng][:lng]).to eq(-104.99202)
        expect(location[:locations].first[:latLng][:lat]).to eq(39.74001)
      end
    end
  end
end