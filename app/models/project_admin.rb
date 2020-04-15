class ProjectAdmin < ApplicationRecord
  belongs_to :admin
  belongs_to :project
end
