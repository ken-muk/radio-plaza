class RenameTypeColumnToSongs < ActiveRecord::Migration[6.0]
  def change
    rename_column :songs, :type, :song_type
  end
end
