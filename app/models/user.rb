# Model of +User+ entity
class User < ApplicationRecord
  include ActiveModel::Validations

  has_many :posts

  has_secure_password

  validates :username, presence: true, length: { minimum: 4, maximum: 32 }, uniqueness: true
  validates :email, presence: true, email: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 7, maximum: 64 }
end
