require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:all) { @post1 = build :post }

  let!(:request_body) do
    {
      post: {
        description: @post1.description,
        location_attributes: (build :location),
        media: @post1.media
      }
    }.to_json
  end

  context 'when creates new post' do
    before { post posts_path, params: request_body, headers: signed_in_headers }
    it { expect(response).to have_http_status 200 }
    let!(:response_body) { JSON.parse response.body }
    let!(:response_post_description) { response_body['data']['attributes']['description'] }
    it { expect(response_post_description).to be_present }
  end
end
