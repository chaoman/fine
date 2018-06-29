require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  before :all do
    @user1 = build :user
  end

  it 'signs user in and returns JWT token' do
    request_body = {
      auth: {
        email: @user1.email,
        password: @user1.password
      }
    }.to_json
    post sessions_path, params: request_body, headers: REQUEST_HEADERS
    response_token = response.body.to_json['access_token']

    expect(response).to have_http_status 200
    expect(response_token).to be_present
  end
end
