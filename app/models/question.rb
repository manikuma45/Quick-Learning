class Question < ApplicationRecord
  belongs_to :user
  belongs_to :part
  belongs_to :subject
  belongs_to :project
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
end
