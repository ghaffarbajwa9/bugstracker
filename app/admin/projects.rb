ActiveAdmin.register Project do
  permit_params :users_id, :user_id, :title, :description, :user_ids=>[], :bug_id=>[], bugs_attributes: [:title, :deadline, :screenshot, :bugtype, :status, :project_id, :user_id, :user_ids=>[]]

  index do
    selectable_column
    id_column
    column :users_id, label: "Created By"
    column :title
    column :description
    column :users
    column :bugs
    actions
  end

  show do
    attributes_table do 
      row :users_id, label: "Created By"
      row :title 
      row :description
      row :users
      row :bugs
    end
    if current_user.usertype !='developer'
      panel 'Add Bug' do

        render partial: 'admin/bugs/form', locals: {project: project} 
      end
    end
    panel 'Bugs' do
      table_for project.bugs do
        # column :id
        column :user, label: "Reported By"
        column :title 
        column :deadline
        column :screenshot do |model|
          if model.screenshot.present?
            image_tag(model.screenshot.url, height: '50')
          else
            content_tag(:span, "No screenshot available")
          end
        end
        column :bugtype
        column :status
        column :users, label: "Associate To"
      end 
    end
  end 

  filter :name
  filter :created_at
  collected_user = User.all.where(usertype:['qa','developer']) 

  form do |f|
    f.inputs do
      f.input :users_id, as: :hidden, input_html: { value: current_user.id }, label: "Created By"
      f.input :title
      f.input :description
      f.input :user_ids, as: :check_boxes, collection: collected_user
    end
    f.actions
  end
  
  controller do
    def scoped_collection
      # Filter the collection based on the current user's ID
      if current_user.usertype == 'manager'
        @projects = Project.all.where('projects.users_id = ?', current_user.id)
      else
        @projects = Project.joins(:project_assignments)
         .where('project_assignments.user_id = ? OR projects.id IN (SELECT project_id FROM project_assignments WHERE users_id = ?)', current_user.id, current_user.id)
      end
    end
  end
end
