FactoryBot.define do
  factory :location do
    address Faker::Address.full_address
    lat 1.5
    lng 1.5
  end
  factory :post do
    description { Faker::BojackHorseman.quote }
    media { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/testing.jpg'), 'image/jpeg') }
  end
  factory :comment do
    message { Faker::BojackHorseman.quote }
  end
  factory :user do
    username 'schoolboytom'
    email 'tom@schoolboy.io'
    password 'BlahBlahBlah2!'
  end
  factory :random_user, class: User do
    username { Faker::Internet.username(4) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(7) }
  end
end
