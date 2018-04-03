ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at, :phone, :online, :funnel, :name, :promotional_code, :paid, :password, :password_confirmation

  scope :all
  scope :onlines
  scope :offlines

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :online
      f.input :paid
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  index do
    column :id
    column :email                     
    column :provider                            
    column :phone                      
    column :current_sign_in_at do |t|
      time_ago_in_words(t.created_at)
    end

    column :funnel
    
    column :last_sign_in_at do |t|
      time_ago_in_words(t.created_at)
    end

    column :created_at do |t|
      time_ago_in_words(t.created_at)
    end

    column :sign_in_count             

    column :workshops do |t|
      t.workshops.sorted.collect(&:name)
    end


    actions
  end

  show do |us|
    attributes_table do
      row :id
      row :name
      row :email
      row :phone
      row :online
      row :funnel
      row :paid
      row :sign_in_count
      row :last_sign_in_at
      row :current_sign_in_at
      row :inscriptions do |inscriptions|
        us.inscriptions.count
      end


      row :workshops_stats do |stat|
        us.workshops.count.to_s + "/" + Workshop.sorted.count.to_s 
      end

      row :workshops do
        buffer = ""

        us.courses.each do |course|
          buffer << "<h3> #{course.name} </h4>"
          course.chapters.each do |chapter|
            buffer << "<h5> #{chapter.name} </h5>"
            buffer << "<ul>"
            chapter.workshops.each do |workshop|
              buffer << "<li> #{workshop.name}"
              if us.workshops.include?(workshop)
                buffer << " <span style='color:green'> √ </span>"
              else
                buffer << " <span style='color:red'> x </span>" 
              end
              buffer << "</li>" 

            end

            buffer << "</ul>"
          end
        end

        buffer.html_safe

        # us.courses.each.map{ |c| 
        #   "<ul>"
        # us.crossworkshop.map{|cw|
        #   "<p> #{cw} </p>"
        # }.join(",").gsub(/,/,"").html_safe()
      end  
    end
  end

  csv do
    column :id
    column :email
    column :name
    column :phone                      
    column :funnel
    column :last_workshop do |t|
      t.last_workshop.name unless t.last_workshop.nil?
    end

    column :workshops do |t|
      t.workshops.sorted.collect(&:name)
    end

    column :last_sign_in_at
    column :created_at
  
  end

   
  controller do
    def update_resource object, attributes
      attributes.each do |attr|
        if attr[:password].blank? and attr[:password_confirmation].blank?
          attr.delete :password
          attr.delete :password_confirmation
        end
      end

      object.send :update_attributes, *attributes
    end
  end
end

                              
