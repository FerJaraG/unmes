class AddFunnelToUser < ActiveRecord::Migration
  def change
    add_column :users, :funnel, :string
  end
end
