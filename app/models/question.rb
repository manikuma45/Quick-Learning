class Question < ApplicationRecord
  belongs_to :user
  belongs_to :part
  belongs_to :subject
  belongs_to :project
end
