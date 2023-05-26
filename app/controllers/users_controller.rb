class UsersController < ApplicationController

    def create 
        user = User.new(user_params)
        
        if user.save
           # render json: {message: 'user insert successfully'}
            render json: user
        else 
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
        end
                
     end

     def show
        user = User.find_by(id: params[:id])
        profile = user.profile
        # render json: {
        #   user: user.as_json,
        #   profile: profile.as_json
        # }

        render json: UserSerializer.new(user).serializable_hash, status: :created

      end

        
            def update
                user=User.find_by(id: params[:id])
                if user.present?
                    user.update(user_params)
                    render json: {message: "user update successfull"}
                else
                    render json: {error: "user not found for update"}
                end
            end
        
        def index
                users = User.all
            render json: users
        
        end
        
        
        def bulk_orders_delete
            orders= current_user.orders.where(id: params[:order_id])
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
        
            # def destroy 
            # user=User.find_by(id: params[:id])
            # if user.present? 
            #     user.destroy
            #     render json: {message: " user delete suceessfull"}
            # else
            #     render json: {error: "user not found for delete"}
            # end
            # end



        
        private 
        def user_params
        params.require(:users).permit(:first_name,:last_name,:email,:active,:token)
        end


end
