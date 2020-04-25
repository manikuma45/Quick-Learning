class Subject < ApplicationRecord
  belongs_to :project
  has_many :parts, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :title, presence: true
end
