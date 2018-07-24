# Controller responsible for providing +User+ with +Post+ feed
class FeedsController < ApplicationController
  include Paginatable

  FEED_POSTS_PER_PAGE = 20
  FEED_FIRST_PAGE = 0

  expose :posts, -> { FeedService.get_feed(current_user) }

  def index
    page = pagination_params[:page].to_i || FEED_FIRST_PAGE
    feed_posts = posts.map(&:serialized)
    render json: paginate_array(feed_posts, FEED_POSTS_PER_PAGE, page)
  end

  private

  def pagination_params
    params.permit :page
  end
end
