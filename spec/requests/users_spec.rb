require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) { @user1 = build :user }

  let!(:request_body) {
    {
      user: {
        username: @user1.username,
        email: @user1.email,
        password: @user1.password
      }
    }.to_json
  }

  before { User.find_by_username(@user1.username).destroy }
  before { post users_path, params: request_body, headers: REQUEST_HEADERS }

  context 'when creates new user' do
    it { expect(response).to have_http_status 200 }
    let!(:response_json) { response.body.to_json }
    let!(:user_instance) { User.find_by_username(@user1.username) }
    let!(:serialized_user) { UserSerializer.new(user_instance).serialized_json.to_json }
    it { expect(response_json).to be_json_eql serialized_user }
  end
end
