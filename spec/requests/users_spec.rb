require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:valid_user) { build :user }

  let!(:valid_user_request_body) do
    {
      user: {
        username: valid_user.username,
        email: valid_user.email,
        password: valid_user.password
      }
    }.to_json
  end

  let!(:invalid_user_request_body) do
    {
      user: {
        username: valid_user.username,
        email: valid_user.email,
        password: 'asd'
      }
    }.to_json
  end

  describe 'sign up functionality' do
    context 'when creates a new user' do
      before { post users_path, params: valid_user_request_body, headers: REQUEST_HEADERS }
      it { expect(response).to have_http_status 200 }
      let!(:response_json) { response.body.to_json }
      let!(:user_instance) { User.find_by_username(valid_user.username) }
      it { expect(response_json).to be_json_eql user_instance.serialized_json.to_json }
    end

    context 'when fails to create a new user' do
      before { post users_path, params: invalid_user_request_body, headers: REQUEST_HEADERS }
      it { expect(response).to have_http_status 400 }
    end
  end

  context 'when fetches own profile' do
    before { get me_path, headers: signed_in_headers }
    it { expect(response).to have_http_status 200 }
    let!(:response_json) { response.body.to_json }
    let!(:user_instance) { User.find_by_username(valid_user.username) }
    it { expect(response_json).to be_json_eql user_instance.serialized_json.to_json }
  end
end
