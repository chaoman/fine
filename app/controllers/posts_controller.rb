# Controller for +Post+ model
class PostsController < ApplicationController
  POSTS_PER_PAGE = 10

  def index
    @user_posts = current_user.posts
                              .order(created_at: :desc)
                              .limit(POSTS_PER_PAGE)
                              .offset(pagination_params[:page] || 0)
    render json: @user_posts.map(&:serialized)
  end

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

  def pagination_params
    params.permit(:page)
  end
end
