# frozen_string_literal: true

FactoryBot.define do
  factory :supplier do
    company_name Faker::Company.name
    email { Faker::Internet.email }
  end
end
