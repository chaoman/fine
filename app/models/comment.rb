# Model of Comment entity
class Comment < ApplicationRecord
  include Likeable
  include Serializable
  serializable serializer_class: CommentSerializer

  belongs_to :post, foreign_key: :post_id
  belongs_to :user, foreign_key: :user_id
end
