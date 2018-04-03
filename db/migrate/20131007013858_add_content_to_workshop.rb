class AddContentToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :content, :text
  end
end
