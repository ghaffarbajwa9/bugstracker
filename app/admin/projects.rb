ActiveAdmin.register Project do
  permit_params :title, :description, :user_ids=>[]

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :users
    actions
  end

  show do
    attributes_table do 
      row :title 
      row :description
      row :users
    end
  end 

  filter :name
  filter :created_at
  collected_data = User.all 

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :user_ids, as: :check_boxes,  collection: collected_data
    end
    f.actions
  end
  

end
