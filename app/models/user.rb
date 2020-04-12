class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable,
  validate_on_invite: true, invite_for: 24.hours
  validates :name, presence: true
end
