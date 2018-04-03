class Addpaypalbuttontocourse < ActiveRecord::Migration
  def change
    add_column :courses, :paypal, :text
  end
end
