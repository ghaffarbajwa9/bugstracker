# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    panel "Projects" do
      table_for Project.all do
        column "Name" do |project|
          link_to project.title, admin_project_path(project)
        end
        column :description
        # Add other columns as needed
      end
    end
  end # content
end
