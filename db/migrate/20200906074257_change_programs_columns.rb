class ChangeProgramsColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :programs, :day, :string
    remove_column :programs, :start_year, :string
    remove_column :programs, :end_year, :string
    add_column :programs, :day, :int
    add_column :programs, :start_year, :int
    add_column :programs, :end_year, :int, default: 0
  end
end
