class BookSearchService

  def self.search_books(location, quantity)
    get_url("/search.json?title=#{location}&limit=#{quantity}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  #check slashes if you run into trouble

  private
  
  def self.conn 
    Faraday.new(url: "https://openlibrary.org")
  end
end