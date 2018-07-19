# Serializer for Comment entity
class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :message

  attribute :likes do |object|
    object.likes.count
  end
end
