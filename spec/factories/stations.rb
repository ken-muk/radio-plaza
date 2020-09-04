FactoryBot.define do
  factory :station do
    sequence(:name) { |n| "STATION#{n}" }
    broadcast_type { "AM" }

    association :program
  end
end
