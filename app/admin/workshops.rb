ActiveAdmin.register Workshop do
  permit_params :name, :description, :content, :place, :public, :hidden, :chapter_id
  config.sort_order = "place_asc"
  
  index do                            
    column :name
    column :description

    column :place
    column :public
    column :chapter
    column :course

    column :pegados do |t|
        t.stucks.count
    end

    column :hecho do |t|
        t.users.count
    end

    # column :content do |t|
    # 	t.content.html_safe
    # end

    column :created_at do |t|
    	time_ago_in_words(t.created_at)
    end


    actions
  end        

  show do
    attributes_table do
      row :name
      row :place
      row :created_at

      row :hecho_por do |t|
        t.users.collect(&:email)
      end

      row :cuenta_pegados do |t|
        t.stucks.count        
      end

      row :pegados do |t|
        t.stucks.collect(&:email)  
      end
      
      row :content do |t|
        simple_format t.content
      end

    end

  end

end
