require "rails_helper"

RSpec.describe BookSearchFacade do 
  describe "class methods" do 
    describe ".search_books" do 
      it "returns a hash of book data", :vcr do
        book_search = BookSearchFacade.get_books("Denver, CO", 5)

        expect(book_search).to be_a(BookSearch)
        expect(book_search.id).to eq("null")
        expect(book_search.type).to eq("books")
        expect(book_search.destination).to eq("Denver, CO")
        expect(book_search.books).to be_a(Array)
        expect(book_search.books.count).to eq(5)
        expect(book_search.total_books_found).to be_a(Integer)
        expect(book_search.total_books_found).to eq(45)
        expect(book_search.books.first).to have_key(:isbn)
        expect(book_search.books.first[:isbn]).to be_a(String)
        expect(book_search.books.first).to have_key(:title)
        expect(book_search.books.first[:title]).to be_a(String)
        expect(book_search.books.first).to have_key(:publisher)
        expect(book_search.books.first[:publisher]).to be_a(String)
        expect(book_search.forecast).to be_a(Hash)
        expect(book_search.forecast).to have_key(:summary)
        expect(book_search.forecast[:summary]).to be_a(String)
        expect(book_search.forecast).to have_key(:temperature)
        expect(book_search.forecast[:temperature]).to be_a(Float)
      end
    end
  end
end