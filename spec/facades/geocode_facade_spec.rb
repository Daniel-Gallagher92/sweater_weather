require "rails_helper"

RSpec.describe GeocodeFacade do 
  describe "class methods" do
    describe ".get_coordinates" do
      it "can return coordinates for a city", :vcr do
        geocode = GeocodeFacade.get_coordinates("Denver,Co")
        #{:lat=>39.74001, :lng=>-104.99202}
        expect(geocode).to be_a(Hash)
        expect(geocode).to have_key(:lat)
        expect(geocode).to have_key(:lng)
        expect(geocode[:lat]).to be_a(Float)
        expect(geocode[:lng]).to be_a(Float)
        expect(geocode[:lat]).to eq(39.74001)
        expect(geocode[:lng]).to eq(-104.99202)
      end
    end
  end
end