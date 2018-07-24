# Service with all the necessary methods to build feed
class FeedService
  class << self
    FEED_POSTS_LIMIT = 200
    FEED_RELEVANCY_TIME = (Date.today - 2.days)..Date.today

    FACTORS = {
      first_user_likes: 1.5, # current_user
      second_user_likes: 1.25,
      first_user_comments: 1.75, # current_user
      second_user_comments: 1.25
    }.freeze

    def relationship_strength(user, second_user)
      counts = {
        first_user_likes: post_likes_count(user, second_user),
        second_user_likes: post_likes_count(second_user, user),
        first_user_comments: post_comments_count(user, second_user),
        second_user_comments: post_comments_count(second_user, user)
      }
      weights = counts.map { |key, _| counts[key] * FACTORS[key] }
      weights.reduce(:+) / weights.size.to_f
    end

    def post_relevance(post)
      relevant_likes = post_relevant_likes post
      relevant_comments = post_relevant_comments post
      weights = [
        relevant_likes * FACTORS[:first_user_likes],
        relevant_comments * FACTORS[:first_user_comments]
      ]
      weights.reduce(:+) / weights.size.to_f
    end

    def get_feed(user)
      Post.subscribed(user.following.pluck(:followed_id))
          .last(FEED_POSTS_LIMIT)
          .sort_by { |post| post_final_weight(user, post) }
          .reverse
    end

    private

    def post_likes_count(user_liking, user_being_liked)
      entity_count(:likes, user_liking, user_being_liked)
    end

    def post_comments_count(user_commenting, user_being_commented)
      entity_count(:comments, user_commenting, user_being_commented)
    end

    def post_relevant_likes(post)
      post_relevant_entity_count(post.likes)
    end

    def post_relevant_comments(post)
      post_relevant_entity_count(post.comments)
    end

    def entity_count(entity, user_doing, user_being)
      user_doing.posts
                .includes(entity)
                .select(:user)
                .where("#{entity}": { user: user_being })
                .count
    end

    def post_relevant_entity_count(entity)
      entity.select(:created_at)
            .where(created_at: FEED_RELEVANCY_TIME)
            .count
    end

    def post_final_weight(current_user, post)
      ((current_user.relationship_strength post.user) + post.relevance) / 2
    end
  end
end
