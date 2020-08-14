class CreateProgramSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :program_songs do |t|
      t.references :program, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
