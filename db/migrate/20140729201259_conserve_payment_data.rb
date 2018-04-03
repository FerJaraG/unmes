class ConservePaymentData < ActiveRecord::Migration
  def up
  	paid_users = User.where(:paid => true)
  	course = Course.where(:name => "Rails").first
  	paid_users.each do |u|
  		Payment.create(:user => u, :course => course, :amount => 0)
  	end
  end

  def down
  	Payment.destroy_all
  end

end
