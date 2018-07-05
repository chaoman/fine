# Model for +Post+ entity
class Post < ApplicationRecord
  belongs_to :user
  has_one :location

  validates_presence_of :description
end
