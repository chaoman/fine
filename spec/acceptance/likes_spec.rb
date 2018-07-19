require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Posts' do
  let(:user) { create :user }
  let(:second_user) { create(:user, username: 'andrj123', email: 'andrj123@gmail.com') }
  let(:location) { build :location }
  let(:post) { create(:post, user: second_user, location: location) }
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
end
