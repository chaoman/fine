require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  before(:all) { @user1 = build :user }

  let!(:request_body) {
    {
      auth: {
        email: @user1.email,
        password: @user1.password
      }
    }.to_json
  }

  before { post sessions_path, params: request_body, headers: REQUEST_HEADERS }

  context 'when creates new session' do
    it { expect(response).to have_http_status 200 }
    let!(:response_token) { response.body.to_json['access_token'] }
    it { expect(response_token).to be_present }
  end
end
