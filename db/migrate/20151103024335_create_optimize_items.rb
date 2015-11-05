class CreateOptimizeItems < ActiveRecord::Migration
  def change
    create_table :optimize_items do |t|
      t.text :content
      t.boolean :status
      t.string :from
      t.string :in_charge

      t.timestamps null: false
    end
  end
end
