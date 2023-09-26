require "rails_helper"  

RSpec.describe "Road Trip", type: :request do
  describe "POST /api/v0/road_trip" do
    it "returns a road trip object with weather data if given valid credentials" do 
      user = create(:user)

      trip_params = {
        "origin": "Denver, CO",
        "destination": "Los Angeles, CA",
        "api_key": user.api_key
      }

      headers = {"CONTENT_TYPE" => "application/json"} 

      post "/api/v0/road_trip", params: JSON.generate(trip_params), headers: headers

      expect(response).to be_successful
      expect(response).to have_http_status(200)
      
      trip_data = JSON.parse(response.body, symbolize_names: true)[:data] 

      expect(trip_data).to have_key(:id)
      expect(trip_data[:id]).to eq("null")
      expect(trip_data).to have_key(:type)
      expect(trip_data[:type]).to eq("road_trip")
      expect(trip_data).to have_key(:attributes)
      expect(trip_data[:attributes]).to have_key(:origin)
      expect(trip_data[:attributes][:origin]).to eq("Denver, CO")
      expect(trip_data[:attributes]).to have_key(:destination)
      expect(trip_data[:attributes][:destination]).to eq("Los Angeles, CA")
      expect(trip_data[:attributes]).to have_key(:travel_time)
    end

    it "returns a 401 error if given invalid credentials" do 
      user = create(:user)

      trip_params = {
        "origin": "Denver, CO",
        "destination": "Los Angeles, CA",
        "api_key": "CMTfXjAtv1UGxYKNewuR"
      }

      headers = {"CONTENT_TYPE" => "application/json"} 

      post "/api/v0/road_trip", params: JSON.generate(trip_params), headers: headers

      expect(response).to_not be_successful
      expect(response).to have_http_status(:unauthorized)

      unauthorized_data = JSON.parse(response.body, symbolize_names: true)

      expect(User.find_by(api_key: trip_params[:api_key])).to eq(nil)
      expect(User.find_by(api_key: user.api_key)).to_not eq(nil)
      expect(user.api_key).to_not eq(trip_params[:api_key])
      
      expect(unauthorized_data).to have_key(:error)
      expect(unauthorized_data[:error]).to eq("Invalid credentials")
    end
  end
end