require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Posts' do
  let(:auth_token) { jwt_bearer }
  let(:user) { create :user }
  let(:location) { build :location }
  let(:post) { create(:post, user: user, location: location) }

  header 'Authorization', :auth_token

  post '/posts/:post_id/comments' do
    with_options scope: :comment, with_example: true do
      parameter :message, required: true
    end
    context '200' do
      let(:post_id) { post.id }
      example 'Adding a new comment to post' do
        request = {
          comment: {
            message: 'Really nice photo'
          }
        }

        do_request(request)

        expect(status).to eq(200)
      end
    end
  end
end
