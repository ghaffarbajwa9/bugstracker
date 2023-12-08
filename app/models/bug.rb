class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :bug_users, dependent: :destroy
  has_many :users, through: :bug_users

  mount_uploader :screenshot, ScreenshotUploader

end
