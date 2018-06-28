require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before :all do
    @user1 = create(:user)
  end

  it 'signs user' do
    post :create,
         params: {
             auth: {
                 email: @user1.email,
                 password: @user1.password
             }
         },
         headers: REQUEST_HEADERS,
         format: :json
    jwt = Auth.issue user: @user1.id
    expected_token_response = {
        access_token: jwt
    }
    puts 'RB'
    puts response.body
    response.body.should be_json_eql(expected_token_response)
  end
end
