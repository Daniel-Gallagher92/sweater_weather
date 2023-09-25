class BookSearchFacade 
  def self.get_books(location, quantity)
    @books ||= BookSearchService.search_books(location, quantity)

    mapquest = GeocodeService.get_coordinates(location)
    lat = mapquest[:results][0][:locations][0][:latLng][:lat]
    lon = mapquest[:results][0][:locations][0][:latLng][:lng]

    weather = ForecastService.get_weather(lat, lon)

    books = {destination: location,
      forecast: { summary: weather[:current][:condition][:text],
                  temperature: weather[:current][:temp_f] 
                }, 
      total_books_found: @books[:numFound],
      books: book_hash(@books)
      }
      
      BookSearch.new(books)
  end

  def self.book_hash(book_search)
    book_search[:docs].map do |book|
      {
        isbn: book[:isbn][0],
        title: book[:title],
        publisher: book[:publisher][0]
      }
    end
  end
end