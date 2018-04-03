class AddPromotionalCodeToUser < ActiveRecord::Migration
  def change
    add_column :users, :promotional_code, :string
  end
end
