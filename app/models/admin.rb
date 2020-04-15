class Admin < ApplicationRecord
  devise :database_authenticatable, :validatable
  include DeviseInvitable::Inviter

  has_many :project_admins, dependent: :destroy
  has_many :project_admin_projects, through: :project_admins, source: :project
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, invite_for: 24.hours
  validates :name, presence: true
end
