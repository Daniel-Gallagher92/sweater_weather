require "rails_helper"

RSpec.describe "Book Search API" do 
  describe "GET /api/v1/book-search" do 
    it "returns a hash including destination city, current forecast, total number of search results found and quantity of booked about city", :vcr do 
      get "/api/v1/book-search?location=denver,co&quantity=5"

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      parsed_body = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_body).to be_a(Hash)
      expect(parsed_body).to have_key(:data)
      expect(parsed_body[:data]).to be_a(Hash)
      expect(parsed_body[:data]).to have_key(:id)
      expect(parsed_body[:data][:id]).to eq("null")
      expect(parsed_body[:data]).to have_key(:type)
      expect(parsed_body[:data][:type]).to eq("books")
      expect(parsed_body[:data]).to have_key(:attributes)
      expect(parsed_body[:data][:attributes]).to be_a(Hash)
      expect(parsed_body[:data][:attributes]).to have_key(:destination)
      expect(parsed_body[:data][:attributes][:destination]).to be_a(String)
      expect(parsed_body[:data][:attributes]).to have_key(:forecast)
      expect(parsed_body[:data][:attributes][:forecast]).to be_a(Hash)
      expect(parsed_body[:data][:attributes][:forecast]).to have_key(:summary)
      expect(parsed_body[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(parsed_body[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(parsed_body[:data][:attributes][:forecast][:temperature]).to be_a(Float)
      expect(parsed_body[:data][:attributes]).to have_key(:total_books_found)
      expect(parsed_body[:data][:attributes][:total_books_found]).to be_a(Integer)
      expect(parsed_body[:data][:attributes]).to have_key(:books)
      expect(parsed_body[:data][:attributes][:books]).to be_a(Array)
      expect(parsed_body[:data][:attributes][:books].count).to eq(5)
      expect(parsed_body[:data][:attributes][:books].first).to have_key(:isbn)
      expect(parsed_body[:data][:attributes][:books].first[:isbn]).to be_a(String)
      expect(parsed_body[:data][:attributes][:books].first).to have_key(:title)
      expect(parsed_body[:data][:attributes][:books].first[:title]).to be_a(String)
      expect(parsed_body[:data][:attributes][:books].first).to have_key(:publisher)
    end
  end
end