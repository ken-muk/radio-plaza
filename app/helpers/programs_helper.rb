module ProgramsHelper
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
