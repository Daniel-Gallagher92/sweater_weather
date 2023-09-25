require "rails_helper"

RSpec.describe BookSearch do
  describe "initialize" do 
    it "exists w/ attributes" do 
      books_data = { destination: "denver, co",
        forecast: { summary: "cloudy with a chance of meatballs",
                    temperature: "83 F"
                  },
        total_books_found: 172,
        books: [{
          "isbn": [
            "0762507845",
            "9780762507849"
          ],
          title: "Denver, Co",
          publisher: ["Universal Map Enterprises"]
          }
        ]
      }

      book_search = BookSearch.new(books_data)

      expect(book_search).to be_a(BookSearch)
      expect(book_search.id).to eq("null")
      expect(book_search.type).to eq("books")
      expect(book_search.destination).to eq("denver, co")
      expect(book_search.forecast).to be_a(Hash)
      expect(book_search.forecast[:summary]).to eq("cloudy with a chance of meatballs")
      expect(book_search.forecast[:temperature]).to eq("83 F")
      expect(book_search.total_books_found).to eq(172)
      expect(book_search.books).to be_a(Array)
      expect(book_search.books.first).to be_a(Hash)
      expect(book_search.books.first[:isbn]).to be_a(Array)
      expect(book_search.books.first[:isbn].first).to be_a(String)
      expect(book_search.books.first[:isbn].last).to be_a(String)
      expect(book_search.books.first[:title]).to be_a(String)
      expect(book_search.books.first[:publisher]).to be_a(Array)
    end
  end
end