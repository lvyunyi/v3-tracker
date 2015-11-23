class CreateTestItems < ActiveRecord::Migration
  def change
    create_table :test_items do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
