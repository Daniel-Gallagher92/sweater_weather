class RoadTripFacade

  def self.get_new_road_trip(origin, destination)
    road_trip = GeocodeService.get_directions(origin, destination)

    if road_trip[:info][:statuscode] == 402
      RoadTrip.new(origin, destination, "impossible route", {})
    else
      lat,lon,travel_time = extract_trip_details(road_trip)
      rounded_time, date, arrival_time, full_time = calculate_times(road_trip)
      
      forecast = fetch_weather(lat,lon,date,full_time)
      
      RoadTrip.new(origin, destination, travel_time, forecast)
    end
  end

  private 

  def self.extract_trip_details(road_trip) 
    lat = road_trip[:route][:locations][1][:latLng][:lat]
    lon = road_trip[:route][:locations][1][:latLng][:lng]
    travel_time = road_trip[:route][:formattedTime]
    [lat, lon, travel_time]
  end

  def self.calculate_times(road_trip) 
    time = Time.now + road_trip[:route][:realTime]
    rounded_time = Time.at((time.to_f / 3600).round * 3600)
    date = time.strftime("%Y-%m-%d")
    arrival_time = rounded_time.strftime("%H:%M")
    full_time = "#{date} #{arrival_time}"
    [rounded_time, date, arrival_time, full_time]
  end

  def self.fetch_weather(lat,lon,date,full_time)
    weather = ForecastService.get_weather(lat, lon)
    weather[:forecast][:forecastday].map do |day|
      if day[:date] == date
        day[:hour].map do |hour|
          if hour[:time] == full_time
            return {
              "datetime": full_time,
              "summary": hour[:condition][:text],
              "temperature": hour[:temp_f]
            }
          end
        end
      end
    end
    nil
  end
end