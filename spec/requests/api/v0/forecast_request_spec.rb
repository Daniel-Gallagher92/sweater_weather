require "rails_helper"

RSpec.describe "Forecast Request" do 
  it "can return JSON data for a city's forecast" do 

    headers = { "CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json" }
    get "/api/v0/forecast", headers: headers, params: {location: "Denver,Co"}
    forecast = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful 
  end
end