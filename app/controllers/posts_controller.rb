# Controller for +Post+ model
class PostsController < ApplicationController
  include Paginatable

  expose :posts, -> { current_user.posts }
  expose :post, parent: :current_user

  def index
    user_posts = paginate(posts, offset: pagination_params[:page])
    render json: user_posts.map(&:serialized)
  end

  def create
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

  def pagination_params
    params.permit :page
  end
end
