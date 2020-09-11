FactoryBot.define do
  factory :corner do
    association :program
    sequence(:name) { |n| "CORNER#{n}" }
    content { "CONTENT" }
    subject { "SUBJECT" }

    after(:create) do |corner|
      create_list(:song, 3, corner: corner)
    end
  end
end
