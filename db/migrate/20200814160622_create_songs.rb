class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.string :artist, null: false
      t.string :type, null: false
      t.references :corner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
