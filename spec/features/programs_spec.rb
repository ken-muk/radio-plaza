require 'rails_helper'

RSpec.feature "Programs", type: :feature do
  let!(:program_monday_night) { create(:program, day: 0) }
  let!(:program_monday_midnight) { create(:program, day: 1, start_time: '01:00:00', end_time: '03:00:00') }
  let!(:program_tuesday_night) { create(:program, day: 1) }
  let!(:program_ongoing) { create(:program, end_year: 0) }
  let!(:program_multiple_personality) { create(:program) }
  let!(:sub_personality) { create(:personality, name: "SUB-PERSONALITY", program: program_multiple_personality) }
  let(:station_not_related_to_program) { create(:station) }
  let(:personality_not_related_to_program) { create(:personality) }

  before do
    visit root_path
  end

  scenario "必要な情報が表示されている" do
    expect(page).to have_http_status :ok
    expect(page).to have_content "＜放送時間＞ 月曜日 #{program_monday_night.start_time.strftime('%H:%M')}〜#{program_monday_night.end_time.strftime('%H:%M')}"
    expect(page).to have_content "＜放送時間＞ 月曜日 25:00〜27:00"
    expect(page).to have_content "＜放送期間＞ #{program_monday_night.start_year}〜#{program_monday_night.end_year}"
    expect(page).to have_content "＜パーソナリティー＞ #{program_monday_night.personalities.first.name}（#{program_monday_night.personalities.first.occupation}）"
    expect(page).to have_content "＜キーステーション＞ #{program_monday_night.station.name}（#{program_monday_night.station.broadcast_type}）"
    expect(page).to have_content "＜公式サイト＞ #{program_monday_night.official_url}"
    expect(page).to have_content "＜メールアドレス＞ #{program_monday_night.email}"
    expect(page).to have_content "＜おすすめポイント＞ #{program_monday_night.recommend_point}"
    expect(page).to have_content "＜#{program_monday_night.corners.first.name}＞ #{program_monday_night.corners.first.content}"
    expect(page).to have_content "＜オープニング曲＞\n→#{program_monday_night.songs.first.title}（#{program_monday_night.songs.first.artist}）"

    # 現在も継続中の番組
    expect(page).to have_content "＜放送期間＞ #{program_ongoing.start_year}〜現在"
    # 複数パーソナリティーの番組
    expect(page).to have_content "＜パーソナリティー＞ #{program_multiple_personality.personalities.first.name}（#{program_multiple_personality.personalities.first.occupation}） SUB-PERSONALITY"
  end

  scenario "放送局で絞り込み" do
    click_link program_monday_night.station.name
    expect(page).to have_http_status :ok
    expect(page).to have_content "＜キーステーション＞ #{program_monday_night.station.name}（#{program_monday_night.station.broadcast_type}）"
    expect(page).not_to have_content "＜キーステーション＞ #{station_not_related_to_program.name}（#{station_not_related_to_program.broadcast_type}）"
  end

  scenario "パーソナリティーで絞り込み" do
    click_link program_monday_night.personalities.first.occupation
    expect(page).to have_http_status :ok
    expect(page).to have_content "＜パーソナリティー＞ #{program_monday_night.personalities.first.name}（#{program_monday_night.personalities.first.occupation}）"
    expect(page).not_to have_content "＜パーソナリティー＞ #{personality_not_related_to_program.name}（#{personality_not_related_to_program.name}）"
  end

  scenario "曜日で絞り込み" do
    expect(page).to have_content "＜放送時間＞ 月曜日"
    expect(page).to have_content "＜放送時間＞ 火曜日"
    click_link "月曜日"
    expect(page).to have_http_status :ok
    expect(page).to have_content "＜放送時間＞ 月曜日"
    expect(page).not_to have_content "＜放送時間＞ 火曜日"
  end
end
