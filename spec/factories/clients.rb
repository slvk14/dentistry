# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    first_name { Faker::Name.unique.name }
    last_name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { '123456t' }
    type { 'Client' }
    age { Faker::Number.number(digits: 2) }
    description { Faker::Name.unique.name }
  end
end
