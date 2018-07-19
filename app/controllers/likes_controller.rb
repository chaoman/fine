# Controller responsible for handling +Post+ like requests
class LikesController < ApplicationController
  expose :post, -> { Post.find(params[:post_id]) }

  def like_post
    post.like_by current_user
    if post.save
      render json: post.serialized_json
    else
      respond_with_error(:bad_request, post.errors)
    end
  end

  def unlike_post
    post.unlike_by current_user
    if post.save
      render json: post.serialized_json
    else
      respond_with_error(:bad_request, post.errors)
    end
  end
end
