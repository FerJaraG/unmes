class AddPaidToInscription < ActiveRecord::Migration
  def change
    add_column :inscriptions, :paid, :boolean
  end
end
