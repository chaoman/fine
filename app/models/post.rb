# Model for +Post+ entity
class Post < ApplicationRecord
  include Likeable

  belongs_to :user, foreign_key: :user_id
  has_one :location, validate: true
  has_one_attached :media
  has_many :comments
  accepts_nested_attributes_for :location, allow_destroy: true

  validates_presence_of :description
  validates_presence_of :location

  def serialized
    PostSerializer.new(self)
  end

  def serialized_json
    serialized.serialized_json
  end

  def like_by(user)
    likes.create(user: user, likeable: self)
  end

  def unlike_by(user)
    likes.find_by(user: user).destroy
  end

  def liked_by?(user)
    likes.find_by(user: user).present?
  end
end
