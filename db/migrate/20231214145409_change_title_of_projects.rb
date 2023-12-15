class ChangeTitleOfProjects < ActiveRecord::Migration[7.1]
  def change
    add_index :projects, :title, unique: true
  end
end
