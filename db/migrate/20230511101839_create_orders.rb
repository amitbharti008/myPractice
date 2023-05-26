class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :order_no
      t.string :name
      t.string :description
      t.string :price
      t.string :quantity
      t.string :user_id 

      t.timestamps
    end
  end
end
