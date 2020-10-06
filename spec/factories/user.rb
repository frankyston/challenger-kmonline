# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }

    User.roles.keys.each do |role_name|
      trait role_name.to_sym do
        role { role_name }
      end
    end
  end
end
