ActiveAdmin.register Project do
  permit_params :title, :description, :user_ids=>[], :bug_id=>[], bugs_attributes: [:title, :deadline, :screenshot, :bugtype, :status, :project_id, :user_id, :user_ids=>[]]

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
    panel 'Add Bug' do
      render partial: 'admin/bugs/form', locals: {project: project} 
    end
    panel 'Bugs' do
      table_for project.bugs do
      
        column :user, label: "Created By"
        column :title 
        column :deadline
        column :screenshot 
        column :bugtype
        column :status
        column :users, label: "Associate To" 
      end 
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
      # f.inputs do
      #   f.has_many :bugs, 
      #             new_record: "Add Bug", 
      #             remove_record: "Remove Bug" do |b|
      #       b.input :user_id, as: :hidden, input_html: { value: current_user.id }, label: "Created By"
      #       b.input :project_id, input_html: { value: project.id }
      #       # b.input :project_id,as: :hidden, input_html: { value: project.id }
      #       b.input :title
      #       b.input :deadline, as: :datetime_picker
      #       b.input :screenshot, as: :file
      #       b.input :bugtype, as: :select, collection: ['Feature', 'Bug'], input_html: { id: 'type_select' }
      #       b.input :status, as: :select, collection: [], input_html: { id: 'status_select' }
      #       b.input :user_ids, as: :select, collection: User.all, label: "Assigned To"
      #   end
      # end
    end
    f.actions
  end
  
end
