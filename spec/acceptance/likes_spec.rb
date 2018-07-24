require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Likes' do
  let(:user) { create :user }
  let(:second_user) { create :random_user }
  let(:location) { build :location }
  let(:post) { create(:post, user: second_user, location: location) }
  let(:comment) { create(:comment, post: post, user: user) }
  let(:auth_token) { 'Bearer ' << second_user.auth_token }

  header 'Authorization', :auth_token

  put '/posts/:post_id/like' do
    context '200' do
      let(:post_id) { post.id }
      example 'Liking the post' do
        do_request

        expect(status).to eq(200)
      end
    end
  end

  put '/posts/:post_id/unlike' do
    before { post.like_by second_user }
    context '200' do
      let(:post_id) { post.id }
      example 'Unliking the post' do
        do_request

        expect(status).to eq(200)
      end
    end
  end

  put '/comments/:comment_id/like' do
    context '200' do
      let(:comment_id) { comment.id }
      example 'Liking the comment' do
        do_request

        expect(status).to eq(200)
      end
    end
  end

  put '/comments/:comment_id/unlike' do
    before { comment.like_by second_user }
    context '200' do
      let(:comment_id) { comment.id }
      example 'Unliking the comment' do
        do_request

        expect(status).to eq(200)
      end
    end
  end
end
