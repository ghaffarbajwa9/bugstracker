class Project < ApplicationRecord
  has_many :project_assignments, dependent: :destroy
  has_many :users, through: :project_assignments

  has_many :bugs

#   has_many :bug_assignments, dependent: :destroy
#   has_many :bugs, through: :bug_assignments
end
