class ChangePaymentTableName < ActiveRecord::Migration
  def change
  	rename_table :payments, :inscriptions
  end
end
