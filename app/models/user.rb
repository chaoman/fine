# Model of +User+ entity
class User < ApplicationRecord
  include ActiveModel::Validations

  has_many :posts
  has_many :likes
  has_many :comments, dependent: :destroy
  has_many :followers, class_name: 'Follow', foreign_key: 'followed_id'
  has_many :following, class_name: 'Follow', foreign_key: 'follower_id'

  has_secure_password

  validates :username, presence: true, length: { minimum: 4, maximum: 32 }, uniqueness: true
  validates :email, presence: true, email: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 7, maximum: 64 }

  def auth_token
    Auth.issue user: id
  end

  def serialized
    UserSerializer.new(self)
  end

  def serialized_json
    serialized.serialized_json
  end

  def follow(user_to_follow)
    following.create(followed_id: user_to_follow.id)
  end

  def unfollow(user_to_unfollow)
    following.find_by(followed_id: user_to_unfollow.id).destroy
  end

  def following?(user_to_check)
    following.find_by(followed_id: user_to_check.id).present?
  end
end
