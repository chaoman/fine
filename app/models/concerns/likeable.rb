# Model concern for polymorphic +Like+
module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: :likeable

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
end
