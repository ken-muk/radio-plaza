class RenameTypeColumnToPersonalities < ActiveRecord::Migration[6.0]
  def change
    rename_column :personalities, :type, :occupation
  end
end
