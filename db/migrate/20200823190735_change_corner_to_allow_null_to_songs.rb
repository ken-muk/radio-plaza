class ChangeCornerToAllowNullToSongs < ActiveRecord::Migration[6.0]
  def change
    remove_reference :songs, :corner
    add_reference :songs, :corner, foreign_key: true
  end
end
