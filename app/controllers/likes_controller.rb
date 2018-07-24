# Controller responsible for handling +Post+ and +Comment+ like requests
class LikesController < ApplicationController
  expose :post, -> { Post.find(params[:post_id]) }
  expose :comment, -> { Comment.find(params[:comment_id]) }

  def like_post
    like_entity post
  end

  def unlike_post
    unlike_entity post
  end

  def like_comment
    like_entity comment
  end

  def unlike_comment
    unlike_entity comment
  end

  private

  def like_entity(entity)
    entity.like_by current_user
    save_entity entity
  end

  def unlike_entity(entity)
    entity.unlike_by current_user
    save_entity entity
  end

  def save_entity(entity)
    if entity.save
      render json: entity.serialized_json
    else
      respond_with_error(:bad_request, entity.errors)
    end
  end
end
