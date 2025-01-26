# frozen_string_literal: true

FactoryBot.define do
  factory :bank_account do
    name { Faker::Bank.name }
    balance { Faker::Number.decimal }
    user
  end
end
