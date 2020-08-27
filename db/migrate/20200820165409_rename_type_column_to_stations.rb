class RenameTypeColumnToStations < ActiveRecord::Migration[6.0]
  def change
    rename_column :stations, :type, :broadcast_type
  end
end
