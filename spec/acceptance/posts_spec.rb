require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Posts' do
  let(:auth_token) { jwt_bearer }
  let(:post) { build :post }
  let(:location) { build :location }

  header 'Authorization', :auth_token

  post '/posts' do
    post_location_attributes_scope = %i[post location_attributes]

    with_options scope: :post, with_example: true do
      parameter :description, required: true
      parameter :address, required: true, scope: post_location_attributes_scope
      parameter :lat, required: true, scope: post_location_attributes_scope
      parameter :lng, required: true, scope: post_location_attributes_scope
      parameter :media, required: true
    end

    context '200' do
      example 'Creating a new post' do
        request = {
          post: {
            description: post.description,
            location_attributes: {
              address: location.address,
              lat: location.lat,
              lng: location.lng
            },
            media: post.media
          }
        }

        do_request(request)

        expect(status).to eq(200)
      end
    end
  end
end
