class ChangeTimeColumnToPrograms < ActiveRecord::Migration[6.0]
  def change
    remove_column :programs, :time, :string
    add_column :programs, :start_time, :time
    add_column :programs, :end_time, :time
  end
end
