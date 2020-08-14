class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
