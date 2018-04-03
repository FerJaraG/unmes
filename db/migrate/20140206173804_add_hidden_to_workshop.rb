class AddHiddenToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :hidden, :boolean
  end
end
