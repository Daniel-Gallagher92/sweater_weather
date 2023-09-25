require "rails_helper"

RSpec.describe "Book Search API" do 
  describe "GET /api/v1/book-search" do 
    it "returns a hash including destination city, current forecast, total number of search results found and quantity of booked about city", :vcr do 
      get "/api/v1/book-search?location=denver,co&quantity=5"

      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end