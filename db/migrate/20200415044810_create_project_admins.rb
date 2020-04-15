class CreateProjectAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :project_admins do |t|
      t.integer :admin_id
      t.integer :project_id

      t.timestamps
    end
  end
end
