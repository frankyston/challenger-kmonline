# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    content { FFaker::CheesyLingo.sentence[0,50] }
    association :survey
  end
end
