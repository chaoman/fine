# Service with all the necessary methods to build feed
class FeedService
  class << self
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
      weights = [relevant_likes * FACTORS[:first_user_likes], relevant_comments * FACTORS[:first_user_comments]]
      weights.reduce(:+) / weights.size.to_f
    end

    private

    def post_likes_count(user_liking, user_being_liked)
      user_liking.posts.includes(:likes).where(likes: { user: user_being_liked }).count
    end

    def post_comments_count(user_commenting, user_being_commented)
      user_commenting.posts.includes(:comments).where(comments: { user: user_being_commented }).count
    end

    def post_relevant_likes(post)
      post.likes.where(created_at: (Date.today - 2.days)..Date.today).count
    end

    def post_relevant_comments(post)
      post.comments.where(created_at: (Date.today - 2.days)..Date.today).count
    end
  end
end