require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Sessions' do
  post '/sessions' do
    with_options scope: :auth, with_example: true do
      parameter :email, required: true
      parameter :password, required: true
    end
    context '200' do
      let(:user) { create :user }

      example 'Creating a new session / Sign in' do
        request = {
          auth: {
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
