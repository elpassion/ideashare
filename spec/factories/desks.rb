require 'ffaker'

FactoryGirl.define do
  factory :desk do |f|
    association :owner, factory: :user
    f.name 'Desk name'
    f.description 'Such desk, many ideas, wow'
    f.finish_at { 2.day.from_now(Time.current) }
    f.start_at { 1.day.from_now(Time.current) }
  end
end
