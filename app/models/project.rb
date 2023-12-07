class Project < ApplicationRecord
  has_many :project_assignments, dependent: :destroy
  has_many :users, through: :project_assignments

 
end
