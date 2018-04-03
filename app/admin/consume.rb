ActiveAdmin.register Consume do
  csv do
    column :id
	column :q
	column :created_at
	column :user do |c|
		c.user_id
	end
	column :workshop do |c|
		c.workshop_id
	end

  end

end
