class ForecastService 
  def self.conn 
    Faraday.new(url: "http://api.weatherapi.com") do |faraday| 
      faraday.params["key"] = Rails.application.credentials.WEATHER[:api_key]
    end
  end

  def self.get_current(lat, lon)
    response = conn.get("/v1/current.json?q=#{lat},#{lon}") do |faraday| 
      faraday.params[:lat] = lat
      faraday.params[:lon] = lon
      faraday.params[:exclude] = "minutely"
      faraday.params[:units] = "imperial"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end