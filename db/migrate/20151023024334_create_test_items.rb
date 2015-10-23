class CreateTestItems < ActiveRecord::Migration
  def change
    create_table :test_items do |t|
      t.boolean :status
      t.text :content
      t.string :name

      t.timestamps null: false
    end
  end
end
