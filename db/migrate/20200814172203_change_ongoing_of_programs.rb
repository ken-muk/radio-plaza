class ChangeOngoingOfPrograms < ActiveRecord::Migration[6.0]
  def change
    change_column :programs, :ongoing, :boolean, default: true
  end
end
