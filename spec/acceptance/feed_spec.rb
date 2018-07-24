require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Feed' do
  let(:user) { create :user }
  let(:auth_token) { 'Bearer ' << user.auth_token }
  let(:second_user) { create :random_user }
  before { user.follow second_user }
  let(:location) { build :location }
  let(:post) { create(:post, user: second_user, location: location) }

  header 'Authorization', :auth_token

  get '/feed' do
    context '200' do
      example 'Fetching the posts feed for user' do
        post.reload

        do_request

        expect(status).to eq(200)
      end
    end
  end
end
