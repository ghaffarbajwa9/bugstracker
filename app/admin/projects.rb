ActiveAdmin.register Project do
  permit_params :title, :description, :user_ids=>[], :bug_id=>[]

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :users
    column :bugs
    actions
  end

  show do
    attributes_table do 
      row :title 
      row :description
      row :users
      row :bugs
    end
  end 

  filter :name
  filter :created_at
  collected_user = User.all 

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :user_ids, as: :check_boxes,  collection: collected_user
    end
    f.actions
  end
  

end
