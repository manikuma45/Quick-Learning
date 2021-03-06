class Admin < ApplicationRecord
  devise :database_authenticatable, :validatable
  include DeviseInvitable::Inviter

  has_many :projects, dependent: :destroy
  has_many :project_admins, dependent: :destroy
  has_many :project_admin_projects, through: :project_admins, source: :project, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, invite_for: 24.hours
  validates :name, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  def self.guest
    find_or_create_by!(email: 'admin0@example.com') do |admin|
      admin.name = "ゲスト管理者"
      admin.password = "password"
    end
  end
end
