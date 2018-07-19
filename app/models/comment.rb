# Model of Comment entity
class Comment < ApplicationRecord
  include Likeable

  belongs_to :post, foreign_key: :post_id
  belongs_to :user, foreign_key: :user_id

  def serialized
    CommentSerializer.new(self)
  end

  def serializable_hash
    serialized.serializable_hash
  end
end
