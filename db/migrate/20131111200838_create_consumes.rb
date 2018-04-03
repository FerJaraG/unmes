class CreateConsumes < ActiveRecord::Migration
  def change
    create_table :consumes do |t|
      t.integer :user_id
      t.integer :workshop_id
      t.integer :q

      t.timestamps
    end
  end
end
