# Controller responsible for handling +Post+ comments requests
class CommentsController < ApplicationController
  expose :post, -> { Post.find(params[:post_id]) }
  expose :comments, -> { post.comments }

  def create
    comment = comments.new(comment_params)
    comment.user = current_user
    if comment.save
      render json: post.serialized_json
    else
      respond_with_error(:bad_request, comment.errors)
    end
  end

  def destroy
    comment = comments.where(user: current_user).where(id: params[:id]).first
    if comment.destroy
      render json: post.serialized_json
    else
      respond_with_error(:bad_request, comment.errors)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
