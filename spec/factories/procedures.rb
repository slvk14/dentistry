# frozen_string_literal: true

FactoryBot.define do
  factory :procedure do
    name { Faker::Name.unique.name }
    duration_min { Faker::Number.number(digits: 2) }
    price_uah { Faker::Number.number(digits: 3) }
  end
end
