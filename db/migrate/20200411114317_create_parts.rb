class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :status, null:false, default: 0
      t.timestamps
    end
  end
end
