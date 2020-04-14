class Project < ApplicationRecord
  has_many :project_users, dependent: :destroy
  has_many :project_user_users, through: :project_users, source: :user
end
