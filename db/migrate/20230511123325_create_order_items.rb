class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.string :name
      t.string :description
      t.string :price
      t.string :quantity
      t.string :order_id
      t.string :user_id

      t.timestamps
    end
  end
end
