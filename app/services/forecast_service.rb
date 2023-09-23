class ForecastService 

  def self.get_weather(lat, lon)
    response = conn.get("/v1/forecast.json?&days=5&q=#{lat},#{lon}") do |faraday| 
      faraday.params[:lat] = lat
      faraday.params[:lon] = lon
      faraday.params[:units] = "imperial"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn 
    Faraday.new(url: "http://api.weatherapi.com") do |faraday| 
      faraday.params["key"] = Rails.application.credentials.WEATHER[:api_key]
    end
  end
end