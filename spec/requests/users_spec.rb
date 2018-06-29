require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :all do
    @user1 = build :user
  end

  it 'creates user and returns serialized model' do
    # DatabaseCleaner doesn't want to cooperate here
    User.find_by_username(@user1.username).destroy

    request_body = {
      user: {
        username: @user1.username,
        email: @user1.email,
        password: @user1.password
      }
    }.to_json
    post users_path, params: request_body, headers: REQUEST_HEADERS
    response_json = response.body.to_json
    user_instance = User.find_by_username(@user1.username)
    serialized_user = UserSerializer.new(user_instance).serialized_json

    expect(response).to have_http_status 200
    expect(response_json).to be_json_eql serialized_user.to_json
  end
end
