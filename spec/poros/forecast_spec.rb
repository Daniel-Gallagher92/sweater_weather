require "rails_helper"

RSpec.describe Forecast do 
  it "exists w/ attributes" do 
    forecast = ForecastFacade.get_forecast("denver,co")

    expect(forecast).to be_a Forecast

    current_weather = forecast.current_weather

    expect(current_weather).to be_a Hash
    expect(current_weather).to have_key :last_updated
    expect(current_weather[:last_updated]).to be_a String
    expect(current_weather).to have_key :temp_f
    expect(current_weather[:temp_f]).to be_a Float
    expect(current_weather).to have_key :feelslike_f
    expect(current_weather[:feelslike_f]).to be_a Float
    expect(current_weather).to have_key :humidity 
    expect(current_weather[:humidity]).to be_a Integer
    expect(current_weather).to have_key :uv
    expect(current_weather[:uv]).to be_a Float
    expect(current_weather).to have_key :visibilty
    expect(current_weather[:visibilty]).to be_a Float
    expect(current_weather).to have_key :condition_text
    expect(current_weather[:condition_text]).to be_a String
    expect(current_weather).to have_key :condition_icon
    expect(current_weather[:condition_icon]).to be_a String

    daily_weather = forecast.daily_weather
    expect(daily_weather).to be_a Array
    expect(daily_weather.count).to eq(5)
    expect(daily_weather.first).to be_a Hash
    expect(daily_weather.first).to have_key :date
    expect(daily_weather.first[:date]).to be_a String
    expect(daily_weather.first).to have_key :max_temp_f
    expect(daily_weather.first[:max_temp_f]).to be_a Float
    expect(daily_weather.first).to have_key :min_temp_f
    expect(daily_weather.first[:min_temp_f]).to be_a Float
    expect(daily_weather.first).to have_key :sunrise
    expect(daily_weather.first[:sunrise]).to be_a String
    expect(daily_weather.first).to have_key :sunset
    expect(daily_weather.first[:sunset]).to be_a String
    expect(daily_weather.first).to have_key :condition_text
    expect(daily_weather.first[:condition_text]).to be_a String
    expect(daily_weather.first).to have_key :condition_icon
    expect(daily_weather.first[:condition_icon]).to be_a String

    hourly_weather = forecast.hourly_weather
    expect(hourly_weather).to be_a Array
    expect(hourly_weather.count).to eq(24)
    expect(hourly_weather.first).to be_a Hash
    expect(hourly_weather.first).to have_key :time
    expect(hourly_weather.first[:time]).to be_a String
    expect(hourly_weather.first).to have_key :temp_f
    expect(hourly_weather.first[:temp_f]).to be_a Float
    expect(hourly_weather.first).to have_key :condition_text
    expect(hourly_weather.first[:condition_text]).to be_a String
    expect(hourly_weather.first).to have_key :condition_icon
    expect(hourly_weather.first[:condition_icon]).to be_a String
  end
end