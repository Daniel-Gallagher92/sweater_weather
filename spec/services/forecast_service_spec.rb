require "rails_helper"

RSpec.describe ForecastService do 
  describe "class methods" do
    describe ".get_weather" do 
      it "returns forecast data for a given location", :vcr do 
        lat = 39.74001
        lon = -104.99202
        current_forecast = ForecastService.get_weather(lat, lon)

        expect(current_forecast).to be_a Hash
        expect(current_forecast).to have_key :current
        expect(current_forecast[:current]).to be_a Hash
        expect(current_forecast[:current]).to have_key :last_updated
        expect(current_forecast[:current][:last_updated]).to be_a String
        expect(current_forecast[:current]).to have_key :temp_f
        expect(current_forecast[:current]).to have_key :feelslike_f
        expect(current_forecast[:current]).to have_key :condition
        expect(current_forecast[:current]).to have_key :humidity
        expect(current_forecast[:current]).to have_key :uv
        expect(current_forecast[:current]).to have_key :vis_miles
        expect(current_forecast[:current][:condition]).to be_a Hash
        expect(current_forecast[:current][:condition]).to have_key :text
        expect(current_forecast[:current][:condition]).to have_key :icon
      end
      
      it "returns daily forecast data for a given location", :vcr do 
        lat = 39.74001
        lon = -104.99202
        daily_forecast = ForecastService.get_weather(lat, lon)
        
        expect(daily_forecast).to be_a Hash
        expect(daily_forecast).to have_key :forecast
        expect(daily_forecast[:forecast]).to be_a Hash
        expect(daily_forecast[:forecast]).to have_key :forecastday
        expect(daily_forecast[:forecast][:forecastday].count).to eq(5)
        expect(daily_forecast[:forecast][:forecastday]).to be_a Array
        expect(daily_forecast[:forecast][:forecastday].first).to have_key :date
        expect(daily_forecast[:forecast][:forecastday].first[:date]).to be_a String
        expect(daily_forecast[:forecast][:forecastday].first).to have_key :day
        expect(daily_forecast[:forecast][:forecastday].first[:day]).to be_a Hash
        expect(daily_forecast[:forecast][:forecastday].first[:day]).to have_key :maxtemp_f
        expect(daily_forecast[:forecast][:forecastday].first[:day]).to have_key :mintemp_f
        expect(daily_forecast[:forecast][:forecastday].first).to have_key :astro
        expect(daily_forecast[:forecast][:forecastday].first[:astro]).to be_a Hash
        expect(daily_forecast[:forecast][:forecastday].first[:astro]).to have_key :sunrise
        expect(daily_forecast[:forecast][:forecastday].first[:astro]).to have_key :sunset
        expect(daily_forecast[:forecast][:forecastday][0][:day]).to have_key :condition
        expect(daily_forecast[:forecast][:forecastday][0][:day][:condition][:text]).to be_a String
        expect(daily_forecast[:forecast][:forecastday][0][:day][:condition][:icon]).to be_a String
      end
      

      it "returns hourly forecast data for a given location", :vcr do 
        lat = 39.74001
        lon = -104.99202
        hourly_forecast = ForecastService.get_weather(lat, lon)  
        
        expect(hourly_forecast).to be_a Hash
        expect(hourly_forecast).to have_key :forecast
        expect(hourly_forecast[:forecast]).to be_a Hash
        expect(hourly_forecast[:forecast]).to have_key :forecastday
        expect(hourly_forecast[:forecast][:forecastday]).to be_a Array
        expect(hourly_forecast[:forecast][:forecastday].first).to have_key :hour
        expect(hourly_forecast[:forecast][:forecastday].first[:hour]).to be_a Array
        expect(hourly_forecast[:forecast][:forecastday].first[:hour].first).to have_key :time
        expect(hourly_forecast[:forecast][:forecastday].first[:hour].first[:time]).to be_a String
        expect(hourly_forecast[:forecast][:forecastday].first[:hour].first).to have_key :temp_f
        expect(hourly_forecast[:forecast][:forecastday].first[:hour].first).to have_key :condition
        expect(hourly_forecast[:forecast][:forecastday].first[:hour].first[:condition]).to be_a Hash
        expect(hourly_forecast[:forecast][:forecastday].first[:hour].first[:condition]).to have_key :text
        expect(hourly_forecast[:forecast][:forecastday].first[:hour].first[:condition]).to have_key :icon
      end
    end
  end
end