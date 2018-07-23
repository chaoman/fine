require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let(:user) { create :user }

  let(:request_body) do
    {
      auth: {
        email: user.email,
        password: user.password
      }
    }.to_json
  end

  before { post sessions_path, params: request_body, headers: REQUEST_HEADERS }

  context 'when creates new session' do
    it { expect(response).to have_http_status 200 }
    let(:response_hash) { JSON.parse(response.body).with_indifferent_access }
    let(:response_token) { response_hash[:data][:attributes][:auth_token] }
    it { expect(response_token).to be_present }
  end
end
