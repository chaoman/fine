# Controller responsible for providing +User+ with +Post+ feed
class FeedsController < ApplicationController
  def index
    followed_users_ids = current_user.following.select(:followed_id)
    followed_users = followed_users_ids.map { |follow| User.find(follow.followed_id) }
                                       .sort_by { |user| current_user.relationship_strength user }

    render json: followed_users
  end
end
