require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Users' do
  let(:user) { create :user }
  let(:second_user) { create :random_user }
  let(:auth_token) { 'Bearer ' << user.auth_token }

  header 'Authorization', :auth_token

  put '/users/:id/follow' do
    context '200' do
      let(:id) { second_user.id }
      example 'Following another user' do
        do_request

        expect(status).to eq(200)
      end
    end
  end

  delete '/users/:id/unfollow' do
    context '200' do
      let(:id) { second_user.id }
      before { user.follow second_user }
      example 'Unfollowing another user' do
        do_request

        expect(status).to eq(200)
      end
    end
  end
end
