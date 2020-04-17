class AddSubjectRefToParts < ActiveRecord::Migration[5.2]
  def change
    add_reference :parts, :subject, foreign_key: true
  end
end
