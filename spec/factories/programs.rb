FactoryBot.define do
  factory :program do
    sequence(:name) { |n| "PROGRAM#{n}" }
    day { 0 }
    start_year { 2000 }
    end_year { 2005 }
    start_time { '20:00:00' }
    end_time { '22:00:00' }
    ongoing { true }
    sequence(:email) { |n| "PROGRAM#{n}@example.com" }
    sequence(:official_url) { |n| "https://PROGRAM#{n}.jp" }
    recommend_point { "TEST" }

    after(:create) do |program|
      create(:program_song, program: program, songs: create(:song))
    end
  end
end
