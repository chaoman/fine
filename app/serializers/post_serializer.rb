# Serializer for +Post+ model
class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :user_id

  attribute :address do |object|
    object.location&.address
  end
end
