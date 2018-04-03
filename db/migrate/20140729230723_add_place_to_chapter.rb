class AddPlaceToChapter < ActiveRecord::Migration
  def change
    add_column :chapters, :place, :integer
  end
end
