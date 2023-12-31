ActiveAdmin.register Bug do
  belongs_to :project, optional: true
  navigation_menu :project
  permit_params :title, :deadline, :screenshot, :bugtype, :status, :project_id, :user_id, :user_ids=>[]

  
  form do |f| 
    f.inputs 'Bug Details' do
      f.input :user_id, input_html: { value: current_user.id }, label: "Reported By"
      f.input :project_id, as: :select, collection: Project.all
      # f.input :project_id,as: :hidden, input_html: { value: project.id }
      f.input :title
      f.input :deadline, as: :datetime_picker
      f.input :screenshot, as: :file
      f.input :bugtype, as: :select, collection: ['Feature', 'Bug'], input_html: { id: 'type_select' }
      f.input :status, as: :select, collection: [], input_html: { id: 'status_select' }
      f.input :user_ids, as: :check_boxes, collection: User.all.where(usertype: 'developer'), label: "Developers"
    end
    f.actions
  end

  show do 
    attributes_table do
      row :user, label: "Reported By"
      row :project 
      row :title 
      row :deadline
      row :screenshot do |model|
        if model.screenshot.present?
          image_tag(model.screenshot.url, height: '50')
        else
          content_tag(:span, "No screenshot available")
        end
      end
      row :bugtype 
      row :status
      row :users
    end
  end
  
end
