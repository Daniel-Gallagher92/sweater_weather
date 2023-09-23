require "rails_helper"

RSpec.describe GeocodeService do 
  describe "class methods" do 
    describe ".get_coordinates" do 
      it "can return coordinates for a city" do 
        location = "Denver,Co"
        response = GeocodeService.get_coordinates(location)
        # :latLng=>{:lat=>39.74001, :lng=>-104.99202},
        expect(response).to be_a(Hash)
        expect(response[:results]).to be_an(Array)
        expect(response[:results][0]).to be_a(Hash)
        expect(response[:results][0][:locations]).to be_an(Array)
        expect(response[:results][0][:locations][0]).to be_a(Hash)
        expect(response[:results][0][:locations][0][:latLng]).to be_a(Hash)
        expect(response[:results][0][:locations][0][:latLng]).to have_key(:lat)
        expect(response[:results][0][:locations][0][:latLng]).to have_key(:lng)
      end
    end
  end
end