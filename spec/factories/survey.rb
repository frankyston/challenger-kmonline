# frozen_string_literal: true

FactoryBot.define do
  factory :survey do
    name { FFaker::Name.name }
    date_init { FFaker::Time.date }
    date_end { FFaker::Time.date }
    permalink { FFaker::Name.name.parameterize }
  end
end
