FactoryBot.define do
  factory :personality do
    sequence(:name) { |n| "PERSONALITY#{n}" }
    occupation { "OCCUPATION" }
    sequence(:official_url) { |n| "https://PERSONALITY#{n}.jp" }

    association :program
  end
end
