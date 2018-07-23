# Model concern for polymorphic +Follow+
module Followable
  extend ActiveSupport::Concern

  included do
    has_many :followers, class_name: 'Follow', foreign_key: 'followed_id'
    has_many :following, class_name: 'Follow', foreign_key: 'follower_id'

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
end
