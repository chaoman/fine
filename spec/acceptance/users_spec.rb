require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Users' do
  header 'Authorization', :auth_token

  post '/users' do
    with_options scope: :user, with_example: true do
      parameter :username, required: true
      parameter :email, required: true
      parameter :password, required: true
    end
    context '200' do
      let(:user) { build :user }

      example 'Creating a new user' do
        request = {
          user: {
            username: user.username,
            email: user.email,
            password: user.password
          }
        }

        do_request(request)

        expect(status).to eq(200)
      end
    end
  end

  get '/users/me' do
    let(:auth_token) { jwt_bearer }
    context '200' do
      example 'Fetching current user data' do
        do_request
        expect(status).to eq(200)
      end
    end
  end

  get '/users/:id' do
    let(:auth_token) { jwt_bearer }
    let(:user) { create :user }
    context '200' do
      let(:id) { user.id }
      example 'Fetching other user data' do
        do_request
        expect(status).to eq(200)
      end
    end
  end

  get '/users/:id/posts' do
    let(:auth_token) { jwt_bearer }
    let(:user) { create :user }
    let(:location) { build :location }
    before { create(:post, user: user, location: location) }
    context '200' do
      let(:id) { user.id }
      example 'Fetching other user\'s posts' do
        do_request
        expect(status).to eq(200)
      end
    end
  end
end
