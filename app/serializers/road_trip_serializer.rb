class RoadTripSerializer
  include JSONAPI::Serializer
  attributes :origin, :destination, :travel_time, :forecast
end
