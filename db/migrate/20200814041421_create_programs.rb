class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.string :name, null: false
      t.string :day, null: false
      t.string :time, null: false
      t.string :start_year
      t.string :end_year
      t.boolean :ongoing
      t.string :email
      t.string :official_url
      t.text :flow
      t.text :content, null: false
      t.text :recommend_point

      t.timestamps
    end
  end
end
