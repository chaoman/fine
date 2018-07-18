# Model of +Like+ entity
class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :user
end
