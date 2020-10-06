# frozen_string_literal: true

FactoryBot.define do
  factory :poll_answer do
    user_ip { FFaker::Internet.ip_v4_address }
    association :survey
    association :answer
  end
end
