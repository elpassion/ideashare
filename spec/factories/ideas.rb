require 'ffaker'

FactoryGirl.define do
  factory :idea do
    association :owner, factory: :user
    desk
    name { FFaker::Vehicle.make }
    description { FFaker::Vehicle.manufacturer_color }
  end
end
