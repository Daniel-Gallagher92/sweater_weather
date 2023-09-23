class GeocodeFacade 
  def self.get_coordinates(location)
    response = GeocodeService.get_coordinates(location)
    response[:results][0][:locations][0][:latLng]
  end
end