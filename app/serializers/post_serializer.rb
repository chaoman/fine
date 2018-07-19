# Serializer for +Post+ model
class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :user_id

  attribute :address do |object|
    object.location&.address
  end

  attribute :likes do |object|
    object.likes.count
  end

  attribute :comments do |object|
    object.comments.map(&:serializable_hash)
  end
end
