class AddPlaceToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :place, :integer
  end
end
