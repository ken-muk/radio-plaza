module ProgramsHelper
  def convert_day(program)
    day = program.day
    case day
    when 0 then
      "日曜日"
    when 1 then
      "月曜日"
    when 2 then
      "火曜日"
    when 3 then
      "水曜日"
    when 4 then
      "木曜日"
    when 5 then
      "金曜日"
    else
      "土曜日"
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

  def fillers(program)
    return program.songs.where(song_type: :フィラー) if program.songs.where(song_type: :フィラー).exists?
  end
end
