require "rails_helper"

RSpec.describe BookSearchService do 
  describe "class methods" do 
    describe ".search_books" do 
      it "returns a hash of book data", :vcr do
        location = "Denver,CO" 

        expect(BookSearchService.search_books(location, 5)).to be_a(Hash)
      end
    end
  end
end