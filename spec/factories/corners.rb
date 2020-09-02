FactoryBot.define do
  factory :corner do
    sequence(:name) { |n| "CORNER#{n}" }
    content { "CONTENT" }
    subject { "SUBJECT" }

    association :program
  end
end
