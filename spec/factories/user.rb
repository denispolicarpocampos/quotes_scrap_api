FactoryBot.define do
  factory :user do
    email        { FFaker::Internet.email }
    password     'secret123'
  end
end