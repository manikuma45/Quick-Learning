class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :status, null:false, default: 'unfinish'
      t.timestamps
    end
  end
end
