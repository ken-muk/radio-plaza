class RemoveFlowContentFromPrograms < ActiveRecord::Migration[6.0]
  def change
    remove_column :programs, :flow, :text
    remove_column :programs, :content, :string
  end
end
