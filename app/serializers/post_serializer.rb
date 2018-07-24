# Serializer for +Post+ model
class PostSerializer
  MAXIMUM_PREVIEW_COMMENTS_COUNT = 10

  include FastJsonapi::ObjectSerializer
  attributes :description, :user_id, :relevance, :created_at

  attribute :address do |object|
    object.location.serialized
  end

  attribute :likes do |object|
    object.likes.count
  end

  attribute :comments do |object|
    object.comments.take(MAXIMUM_PREVIEW_COMMENTS_COUNT).map(&:serialized)
  end

  attribute :media do |object|
    Rails.application.routes.url_helpers.rails_blob_url(object.media) if object.media.attached?
  end
end
