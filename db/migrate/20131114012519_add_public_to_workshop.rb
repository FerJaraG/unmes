class AddPublicToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :public, :boolean, :default => false
  end
end
