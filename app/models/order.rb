class Order < ApplicationRecord
    belongs_to :user 
    has_many :order_items, dependent: :destroy
    accepts_nested_attributes_for :order_items


    after_save :total_sum, :update_total_quantity



    def total_sum
        total_price = 0 

        self.order_items.each do |item|
            new_price = item.quantity.to_i * item.price.to_i
            total_price += new_price
        end
        self.update_column(:price, total_price)
    end


    
    def update_total_quantity
        update_columns(quantity: order_items.count)
    end

end
