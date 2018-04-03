class AddPromotionalCodeToLead < ActiveRecord::Migration
  def change
    add_column :leads, :promotional_code, :string
  end
end
