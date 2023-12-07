class CreateBugUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :bug_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bug, null: false, foreign_key: true

      t.timestamps
    end
  end
end
