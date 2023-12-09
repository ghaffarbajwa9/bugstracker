class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  
  has_many :projects
         
  has_many :project_assignments, dependent: :destroy
  has_many :projects, through: :project_assignments

  has_many :bug_users, dependent: :destroy
  has_many :bugs, through: :bug_users
  
  def manager?
    usertype=='manager'
  end
  def developer?
    usertype == 'developer'
  end
  def qa?
    usertype == 'qa'
  end
end
