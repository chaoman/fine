class User < ApplicationRecord
  include ActiveModel::Validations

  has_secure_password

  validates :username, presence: true, length: {minimum: 4}
  validates :email, presence: true, email: true
  validates :password, presence: true, length: {minimum: 7}

  validates_uniqueness_of :email, on: :create
end
