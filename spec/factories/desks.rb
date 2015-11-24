require 'ffaker'

FactoryGirl.define do
  factory :desk do |f|
    association :owner, factory: :user
    f.name "Desk name"
    f.description "Such desk, many ideas, wow"
    f.finish_at { rand(1.days).seconds.from_now }
    f.start_at { finish_at ? finish_at - 1.days : rand(1.days).seconds.ago }
  end
end
