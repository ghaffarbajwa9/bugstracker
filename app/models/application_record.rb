class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def self.ransackable_attributes(auth_object = nil)
    ["created_at","project_id","user_id","bug_users_id","bug_users_user_id","deadline","screenshot","bugtype","status","title", "description", "email","usertype", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["project_assignments", "users"]
  end
end
