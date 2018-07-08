# Serializer for +Post+ model
class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :user, :location
end
