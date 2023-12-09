class Project < ApplicationRecord
  # belongs_to :user
  has_many :project_assignments, dependent: :destroy
  has_many :users, through: :project_assignments
  
  has_many :bugs, dependent: :destroy
  accepts_nested_attributes_for :bugs, allow_destroy: true
  

#   has_many :bug_assignments, dependent: :destroy
#   has_many :bugs, through: :bug_assignments
end
