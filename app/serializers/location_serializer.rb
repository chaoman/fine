# Serializer for Location entity
class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :address, :lat, :lng
end
