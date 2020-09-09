module ProgramsHelper
  def convert_day(day)
    case day
    when 0 then
      "月曜日"
    when 1 then
      "火曜日"
    when 2 then
      "水曜日"
    when 3 then
      "木曜日"
    when 4 then
      "金曜日"
    when 5 then
      "土曜日"
    when 6 then
      "日曜日"
    else
      "不定期"
    end
  end

  def convert_time(program)
    if program.start_time.hour < 5
      start_hour = program.start_time.hour + 24
      end_hour = program.end_time.hour + 24
      return "#{start_hour}:#{program.start_time.strftime('%M')}〜#{end_hour}:#{program.end_time.strftime('%M')}"
    else
      return "#{program.start_time.strftime('%H:%M')}〜#{program.end_time.strftime('%H:%M')}"
    end
  end

  def convert_end_year(program)
    if program.end_year == 0
      "現在"
    end
  end

  def opening(program)
    return program.songs.where(song_type: :オープニング) if program.songs.where(song_type: :オープニング).exists?
  end

  def ending(program)
    return program.songs.where(song_type: :エンディング) if program.songs.where(song_type: :エンディング).exists?
  end

  def jingles(program)
    return program.songs.where(song_type: :ジングル) if program.songs.where(song_type: :ジングル).exists?
  end

  def talk_bgms(program)
    return program.songs.where(song_type: :トークBGM) if program.songs.where(song_type: :トークBGM).exists?
  end

  def fillers(program)
    return program.songs.where(song_type: :フィラー) if program.songs.where(song_type: :フィラー).exists?
  end
end
