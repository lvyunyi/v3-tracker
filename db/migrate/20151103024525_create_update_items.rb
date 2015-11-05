class CreateUpdateItems < ActiveRecord::Migration
  def change
    create_table :update_items do |t|
      t.text :content
      t.string :from

      t.timestamps null: false
    end
  end
end
