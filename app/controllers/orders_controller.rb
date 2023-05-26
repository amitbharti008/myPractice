class OrdersController < ApplicationController
     before_action :get_order ,only:[:show_order,:update_order,:destroy]


#     def create
    
#         order = current_user.orders.build(order_params) 
#         if order.save
#             render json: {
#                "order_no" =>order.order_no,
#                "name" =>order.name,
#                "description" =>order.description,
#                "price" =>order.price,
#                "quantity" =>order.quantity,
#                "user_id" =>order.user_id
#             }
#             else
#                 render json: { error: order.errors.full_messages }, status: :unprocessable_entity
#             end
#   end


        

  
  def create_order
    
    order = current_user.orders.build(order_params) 
    if order.save
           
        get_order_items(order.order_items)

        render json: {
           "order_no" =>order.order_no,
           "name" =>order.name,
           "description" =>order.description,
           "price" =>order.price,
           "quantity" =>order.quantity,
           "order_items" => get_order_items(order.order_items)
           
        }
        else
            render json: { error: order.errors.full_messages }, status: :unprocessable_entity
        end
end


# def show 
#     order = current_user.orders.find_by(id: params[:id])
#     user = order.user
#     render json: order
# end


def show_order
    order = current_user.orders.find_by(id: params[:id])
  if order.present?
    # render json: {
    #   "order_no" =>@order.order_no,
  
    #   "name" =>@order.name,
    #   "description" =>@order.description,
    #   "price" =>@order.price,
    #   "quantity" =>@order.quantity,
    #   "user_id" =>@order.user_id,
    #   "order_items" => get_order_items(@order.order_items)
    #   }
   # -------------------------------------------------Alternative Method--------------------------------------------------------
      
   
   render json: OrderSerializer.new(order).serializable_hash, status: :created
          else
        render json: {error: "order not found "}
        end 
      end
  



# def update 
#     order = current_user.orders.find_by(id: params[:id])
#     if @order.present?
#         @order.update(order_params)
#         render json: {message: "order update successful" }
#     else
#         render json: {message: "order  not found for update"}
#     end
# end


def update_order 
    if @order.present?
        @order.update(order_params)
        render json: {
          "order_no" =>@order.order_no,
       "name" =>@order.name,
       "description" =>@order.description,
       "price" =>@order.price,
       "quantity" =>@order.quantity,
       "user_id" =>@order.user_id,
       "order_items" => get_order_items(@order.order_items)
       }
    else
        render json: {message: "order  not found for update"}
    end
end





def index 
    @order = current_user.orders
    render json: OrderSerializer.new(order).serializable_hash, status: :created

end


def destroy 
   
      if @order.present?
          @order.destroy
          render json: {message: "order delete successful"}
      else
          render json: {error: "order not found for delete"}
      end
end


   def bulk_orders_delete
            orders= current_user.orders.where(id: params[:order_ids])
            if orders.present?
                orders.destroy_all
                render json: {message: 'all orders deleted'}
            else
                render json: {error: 'orders not found'}
            end
        end


            def order_by_user
                    order = current_user.total.orders
                    render json: orders
            end

private

def get_order_items(order_items)
    oi1 =[]
    order_items.each do |order_item|
        oi={}
                oi["id"] = order_item.id
                oi["name"] = order_item.name
               oi["description"] = order_item.description
               oi["price"] = order_item.price
                oi["quantity"] = order_item.quantity
                oi1 << oi
    
    end
    oi1
end


def get_order
  @order = current_user.orders.find_by(id: params[:id])
end


def order_params
  params.require(:orders).permit( :order_no ,:name, :description, :price, :quantity, :user_id, order_items_attributes: [:id, :name, :description, :price, :quantity, :order_id, :user_id])  
end

end
