class CreateCorners < ActiveRecord::Migration[6.0]
  def change
    create_table :corners do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.string :subject
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
