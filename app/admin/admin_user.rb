ActiveAdmin.register AdminUser do     
  collection_action :autocomplete_admin_user_email, :method => :get

  controller do
      autocomplete :admin_user, :email
  end

  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end                                 
end                                   
