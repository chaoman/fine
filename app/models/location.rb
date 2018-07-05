# Model of +Location+ entity
class Location < ApplicationRecord
  belongs_to :post

  validates :address, presence: true
  validates :lat, presence: true, numericality: :only_float
  validates :lng, presence: true, numericality: :only_float
end
