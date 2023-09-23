class GeocodeService
  def self.conn 
    Faraday.new(url: "https://www.mapquestapi.com/geocoding/v1/address?") do |faraday|
      faraday.params[:key] = Rails.application.credentials.MAPQUEST[:api_key]
    end
  end

  def self.get_coordinates(location)
    response = conn.get do |faraday|
      faraday.params["location"] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end