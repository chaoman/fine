# Model for +Post+ entity
class Post < ApplicationRecord
  include Likeable
  include Serializable
  serializable serializer_class: PostSerializer

  belongs_to :user, foreign_key: :user_id
  has_one :location, validate: true
  has_one_attached :media
  has_many :comments
  accepts_nested_attributes_for :location, allow_destroy: true

  validates_presence_of :description
  validates_presence_of :location

  def relevance
    FeedService.post_relevance(self)
  end
end
