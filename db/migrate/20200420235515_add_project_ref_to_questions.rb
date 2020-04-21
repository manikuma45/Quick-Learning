class AddProjectRefToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :project, foreign_key: true
  end
end
