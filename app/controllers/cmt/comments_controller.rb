module Cmt
    class CommentsController < ApplicationController
        def create
            comment = Comment.new(comment_params)
            if comment.save
            render json: comment
            else    
                render json: {error: comment.errors.full_messages }
            end
        end


        
        def index  
          
            case params[:type]
            when "post"
                comments = BlogModule::Comment.where(commentable_type: "Post")
            when "event"
                comments = BlogModule::Comment.where(commentable_type: "Event")
            when "forum"
                comments = BlogModule::Comment.where(commentable_type: "Forum")
            else
                comments = Comment.all 
            end
            render json: comments, each_serializer: CommentSerializer
        end
            


    private

    def comment_params
        params.require(:comments).permit( :content, :commentable_type, :commentable_id)  
    end

    end
    
end
