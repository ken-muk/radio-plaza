class CreatePersonalities < ActiveRecord::Migration[6.0]
  def change
    create_table :personalities do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.string :official_url
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
