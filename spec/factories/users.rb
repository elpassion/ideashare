require 'ffaker'

FactoryGirl.define do
  factory :user do |f|
    f.email "joe.doe@mail.com"
    f.date_of_birth { FFaker::Time.date.to_date }
    password "admin123"
    password_confirmation { "admin123" }
  end
end
