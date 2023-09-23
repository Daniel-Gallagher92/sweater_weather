class ForecastFacade 
  def self.get_current(lat, lon)
    forecast = ForecastService.get_current(lat, lon)
  end
end