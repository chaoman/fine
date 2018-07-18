FactoryBot.define do
  factory :location do
    address 'Poznan, Poland'
    lat 1.5
    lng 1.5
  end
  factory :post do
    description 'Nice sunset over #bangkok'
    media { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/testing.jpg'), 'image/jpeg') }
  end
  factory :user do
    username 'schoolboytom'
    email 'tom@schoolboy.io'
    password 'BlahBlahBlah2!'
  end
  factory :like do
    post_id 1
    user_id 1
  end
end
