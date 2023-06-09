class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,null: false 
      t.text       :item_text,null: false 
      t.integer    :category_id,null: false 
      t.integer    :detail_id,null: false 
      t.integer    :profecture_id,null: false 
      t.integer    :region_id,null: false 
      t.integer    :days_to_ship_id,null: false 
      t.integer    :price,null: false 
      t.references :user,null: false, foreign_key: true
      t.timestamps
    end
  end
end
