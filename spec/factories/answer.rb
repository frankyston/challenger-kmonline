# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    content { FFaker::CheesyLingo.sentence[0,50] }
    association :question
  end
end
