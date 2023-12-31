require "rails_helper"

RSpec.describe "User API", type: :request do 
  describe "POST /api/v0/users" do 
    it "can create a user w/ valid credentials" do 
      params = {
        "email": "doot@doot.com",
        "password": "password123",
        "password_confirmation": "password123"
      }

      headers = {"CONTENT_TYPE" => "application/json"}  
      post "/api/v0/users", headers: headers, params: JSON.generate(user: params)

      expect(response).to be_successful
      expect(response).to have_http_status(201)
      
      new_user = User.last
      user_data = JSON.parse(response.body, symbolize_names: true)

      expect(user_data).to be_a(Hash)
      expect(user_data).to have_key(:data)
      expect(user_data[:data]).to be_a(Hash)
      expect(user_data[:data]).to have_key(:id)
      expect(user_data[:data][:id]).to eq(new_user.id.to_s)
      expect(user_data[:data][:attributes][:email]).to eq(new_user.email)
      expect(user_data[:data][:attributes][:api_key]).to eq(new_user.api_key)
    end

    it "cannot create a user w/ invalid credentials" do 
      params = {
        "email": "noot@doot.com",
        "password": "password1",
        "password_confirmation": "password3"
      }

      headers = {"CONTENT_TYPE" => "application/json"}  
      post "/api/v0/users", headers: headers, params: JSON.generate(user: params) 

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)

      error_data = JSON.parse(response.body, symbolize_names: true)

      expect(error_data).to be_a(Hash)
      expect(error_data).to have_key(:error)
      expect(error_data[:error]).to eq("Validation failed: Password confirmation doesn't match Password")
    end

    it "cannot create a user w/ an existing email" do 
      existing_user = User.create!(email: "doot@doot.com", password: "password123", password_confirmation: "password123")
      
      params = {
        "email": "doot@doot.com",
        "password": "password123",
        "password_confirmation": "password123"
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v0/users", headers: headers, params: JSON.generate(user: params) 

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)

      error_data = JSON.parse(response.body, symbolize_names: true)

      expect(error_data).to be_a(Hash)
      expect(error_data).to have_key(:error)
      expect(error_data[:error]).to eq("Validation failed: Email has already been taken")
    end

    it "cannot create a user if fields are missing" do 
      params = {
        "email": "",
        "password": "",
        "password_confirmation": ""
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v0/users", headers: headers, params: JSON.generate(user: params)

      error_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      expect(error_data).to be_a(Hash)
      expect(error_data).to have_key(:error)
      expect(error_data[:error]).to eq("Validation failed: Email can't be blank, Password digest can't be blank, Password can't be blank")
    end
  end
end