# Model for +Post+ entity
class Post < ApplicationRecord
  belongs_to :user
  has_one :location, validate: true
  has_many :likes
  has_one_attached :media
  accepts_nested_attributes_for :location, allow_destroy: true

  validates_presence_of :description
  validates_presence_of :location

  def serialized
    PostSerializer.new(self)
  end

  def serialized_json
    serialized.serialized_json
  end

  def liked_by?(user)
    likes.find_by(user_id: user.id).present?
  end
end
