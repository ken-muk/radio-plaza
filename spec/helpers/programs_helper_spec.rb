require 'rails_helper'

RSpec.describe ProgramsHelper do
  include ProgramsHelper
  let(:program) { create(:program) }

  describe "曜日表示" do
    it "sort_day" do
      expect(sort_day(program.day)).to eq "月曜日"
    end

    it "5:01〜23:59スタートの番組の場合、そのままの曜日を表示" do
      expect(convert_day(program)).to eq "月曜日"
    end

    it "0:00〜5:00スタートの番組の場合、前日の曜日に変更" do
      program.update(day: 2, start_time: '01:00:00', end_time: '03:00:00')
      expect(convert_day(program)).to eq "火曜日"
    end
  end

  describe "時刻表示" do
    it "5:01〜23:59スタートの番組の場合、そのままの時刻を表示" do
      expect(convert_time(program)).to eq "#{program.start_time.strftime('%H:%M')}〜#{program.end_time.strftime('%H:%M')}"
    end

    it "0:00〜5:00スタートの番組の場合、24:00〜29:00スタートに変更" do
      program.update(start_time: '01:00:00', end_time: '03:00:00')
      expect(convert_time(program)).to eq "25:00〜27:00"
    end
  end

  describe "継続中番組は終了年を「現在」に変更" do
    it "convert_end_yearメソッド" do
      program.update(end_year: 0)
      expect(convert_end_year(program)).to eq "現在"
    end
  end

  describe "曲のタイプ分け" do
    it "openingメソッド" do
      expect(opening(program)).to eq (program.songs.where(song_type: :オープニング))
    end

    it "endingメソッド" do
      program.songs.first.update(song_type: :エンディング)
      expect(ending(program)).to eq (program.songs.where(song_type: :エンディング))
    end

    it "jinglesメソッド" do
      program.songs.first.update(song_type: :ジングル)
      expect(jingles(program)).to eq (program.songs.where(song_type: :ジングル))
    end

    it "talk_bgmsメソッド" do
      program.songs.first.update(song_type: :トークBGM)
      expect(talk_bgms(program)).to eq (program.songs.where(song_type: :トークBGM))
    end

    it "fillersメソッド" do
      program.songs.first.update(song_type: :フィラー)
      expect(fillers(program)).to eq (program.songs.where(song_type: :フィラー))
    end
  end
end
