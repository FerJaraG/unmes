class AddChapterIdToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :chapter_id, :integer
  end
end
