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
  factory :random_user, class: User do
    username { Faker::Internet.username(4) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(7) }
  end
end
