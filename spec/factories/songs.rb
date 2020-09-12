FactoryBot.define do
  factory :song do
    sequence(:title) { |n| "SONG#{n}" }
    sequence(:artist) { |n| "ARTIST#{n}" }
    song_type { "オープニング" }
  end
end
