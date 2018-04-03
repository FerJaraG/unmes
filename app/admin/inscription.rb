ActiveAdmin.register Inscription do
  form do |f|
    f.inputs do
      # :user_id, collection: User.all.collect{|u| [u.email, u.id]}
      f.input :user_id, :as => :select, :collection => User.all.map{|u| [u.email, u.id]}
      f.input :course_id, :as => :select, :collection => Course.all.map{|u| [u.name, u.id]}
      f.input :amount
      f.input :paid

    end
    f.actions

  end

  index do                        
    column :id
    column :course
    column :user
    column :created_at
    column :paid
    column :amount
    actions
  end

  filter :user_email, :as => :string
  filter :user_name, :as => :string

  filter :course
  #filter :user, :collection => proc {(User.all).map{|u| [u.name, u.id]}}, :label => "Nombre"
  #filter :user, :collection => proc {(User.all).map{|u| [u.email, u.id]}}, :label => "Email"

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  permit_params :user_id, :course_id, :amount, :paid
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  # controller do
  #   def update_resource object, attributes
  #     attributes.each do |attr|
  #       unless attr[:user_email].blank? 
  #         user = User.where(email:attr[:user_email]).limit(1)
  #       end
  #     end

  #     object.send :update_attributes, *attributes
  #   end
  # end
  
end
