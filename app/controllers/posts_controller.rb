# Controller for +Post+ model
class PostsController < ApplicationController
  def create
    post = current_user.posts.new post_params
    if post.save
      render json: post.serialized_json
    else
      respond_with_error(:bad_request, post.errors)
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :description,
      location_attributes: %i[
        address
        lat
        lng
      ]
    )
  end
end
