require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Users' do
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
end
