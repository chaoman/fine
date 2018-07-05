FactoryBot.define do
  factory :location do
    address "MyString"
    lat 1.5
    lng 1.5
  end
  factory :user do
    username 'schoolboytom'
    email 'tom@schoolboy.io'
    password 'BlahBlahBlah2!'
  end
end
