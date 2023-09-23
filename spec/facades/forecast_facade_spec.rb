require "rails_helper"

RSpec.describe ForecastFacade do 
  describe "class methods" do
    describe ".get_current" do
      it "returns current forecast data for a given location", :vcr do 
        latLng = {:lat=>39.74001, :lng=>-104.99202}
        current_forecast = ForecastFacade.get_current(latLng[:lat], latLng[:lng])

        expect(current_forecast).to be_a Hash
        expect(current_forecast).to have_key :current
        expect(current_forecast[:current]).to be_a Hash
        expect(current_forecast[:current]).to have_key :last_updated
        expect(current_forecast[:current]).to have_key :temp_f
        expect(current_forecast[:current]).to have_key :feelslike_f
        expect(current_forecast[:current]).to have_key :humidity
        expect(current_forecast[:current]).to have_key :uv
        expect(current_forecast[:current]).to have_key :vis_miles
        expect(current_forecast[:current]).to have_key :condition
        expect(current_forecast[:current][:condition]).to be_a Hash
        expect(current_forecast[:current][:condition]).to have_key :text
        expect(current_forecast[:current][:condition]).to have_key :icon
      end
    end
  end
end