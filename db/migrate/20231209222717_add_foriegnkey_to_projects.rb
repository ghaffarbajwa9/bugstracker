class AddForiegnkeyToProjects < ActiveRecord::Migration[7.1]
  def change
    add_reference :projects, :users, null: false, foreign_key: true
  end
end
