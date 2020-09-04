FactoryBot.define do
  factory :program do
    sequence(:name) { |n| "PROGRAM#{n}" }
    day { "月曜日" }
    time { "25:00〜27:00" }
    start_year { "2016年" }
    end_year { "現在" }
    ongoing { true }
    sequence(:email) { |n| "PROGRAM#{n}@example.com" }
    sequence(:official_url) { |n| "https://PROGRAM#{n}.jp" }
    recommend_point { "TEST" }
  end
end
