# Controller handling follow requests
class FollowsController < ApplicationController
  expose :user, -> { User.find(params[:id]) }

  def create
    follow = current_user.follow user
    if follow
      render json: user.serialized_json
    else
      respond_with_error(:bad_request, follow.errors)
    end
  end

  def destroy
    unfollow = current_user.unfollow user
    if unfollow
      render json: user.serialized_json
    else
      respond_with_error(:bad_request, follow.errors)
    end
  end
end
