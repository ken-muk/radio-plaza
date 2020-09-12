FactoryBot.define do
  factory :personality do
    association :program
    sequence(:name) { |n| "PERSONALITY#{n}" }
    sequence(:occupation) { |n| "OCCUPATION#{n}" }
    sequence(:official_url) { |n| "https://PERSONALITY#{n}.jp" }
  end
end
