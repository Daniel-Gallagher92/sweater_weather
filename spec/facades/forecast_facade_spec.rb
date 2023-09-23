require "rails_helper"

RSpec.describe ForecastFacade do 
  describe "class methods" do
    describe ".get_current" do
      it "returns a forecast object for a given location", :vcr do 
        forecast = ForecastFacade.get_forecast("denver,co")

        expect(forecast).to be_a Forecast
        expect(forecast.current_weather).to be_a Hash
        expect(forecast.daily_weather).to be_a Array
        expect(forecast.daily_weather.count).to eq(5)
        expect(forecast.daily_weather.first).to be_a Hash
        expect(forecast.hourly_weather).to be_a Array
        expect(forecast.hourly_weather.count).to eq(24)
        expect(forecast.hourly_weather.first).to be_a Hash
      end
    end
  end
end