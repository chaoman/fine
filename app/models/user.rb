# Model of +User+ entity
class User < ApplicationRecord
  include ActiveModel::Validations
  include Serializable
  serializable serializer_class: UserSerializer
  include Followable

  has_many :posts
  has_many :likes
  has_many :comments, dependent: :destroy

  has_secure_password

  validates :username, presence: true, length: { minimum: 4, maximum: 32 }, uniqueness: true
  validates :email, presence: true, email: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 7, maximum: 64 }

  def auth_token
    Auth.issue user: id
  end

  def relationship_strength(user)
    FeedService.relationship_strength(self, user)
  end
end
