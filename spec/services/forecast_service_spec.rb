require "rails_helper"

RSpec.describe ForecastService do 
  describe "class methods" do
    describe ".get_current" do 
      it "returns forecast data for a given location", :vcr do 
        lat = 39.74001
        lon = -104.99202
        forecast = ForecastService.get_current(lat, lon)
        expect(forecast).to be_a Hash
        expect(forecast).to have_key :current
        expect(forecast[:current]).to be_a Hash
        expect(forecast[:current]).to have_key :last_updated
        expect(forecast[:current]).to have_key :temp_f
        expect(forecast[:current]).to have_key :feelslike_f
        expect(forecast[:current]).to have_key :condition
        expect(forecast[:current]).to have_key :humidity
        expect(forecast[:current]).to have_key :uv
        expect(forecast[:current]).to have_key :vis_miles
        expect(forecast[:current][:condition]).to be_a Hash
        expect(forecast[:current][:condition]).to have_key :text
        expect(forecast[:current][:condition]).to have_key :icon
      end
    end
  end
end