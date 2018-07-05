FactoryBot.define do
  factory :post do
    description 'Nice sunset over #bangkok'
    location nil
    user nil
  end
  factory :location do
    address 'Poznan, Poland'
    lat 1.5
    lng 1.5
  end
  factory :user do
    username 'schoolboytom'
    email 'tom@schoolboy.io'
    password 'BlahBlahBlah2!'
  end
end
