class Subject < ApplicationRecord
  belongs_to :project
  has_many :parts, dependent: :destroy
end
