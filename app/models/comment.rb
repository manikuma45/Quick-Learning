class Comment < ApplicationRecord
  belongs_to :question
  belongs_to :user, optional: true
  belongs_to :admin, optional: true
  validates :content, presence: true
end
