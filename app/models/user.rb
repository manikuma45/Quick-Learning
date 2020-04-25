class User < ApplicationRecord
  has_many :project_users, dependent: :destroy
  has_many :project_user_projects, through: :project_users, source: :project, dependent: :destroy
  has_many :qusetions, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, invite_for: 24.hours
  validates :name, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
