class BooksController < ApplicationController
# filter( before action , around action , after action)
    before_action :get_book ,only:[:show,:update,:destroy,:publish_book]
def create
    
    book = current_user.books.new(book_params)  
    if book.save
        render json: book
        else
            render json: { error: profile.errors.full_messages }, status: :unprocessable_entity
        end
    end



def show
   # user = User.find_by(id: params[:id])
    book = current_user.books.find_by(id: params[:id])
    user = book.user
    render json: {
        book: book.as_json,
        user: user.as_json

    }
end


def update 
   
    book = current_user.books.find_by(id: params[:id])
    if @book.present?
        @book.update(book_params)
        render json: {message: "book update successful" }
    else
        render json: {message: "book  not found for update"}
    end
end



def index
    
@books = current_user.books
render json: @books

end



def destroy 
  #  book = current_user.books.find_by(id: params[:id])
    if @book.present?
        @book.destroy
        render json: {message: "book delete successful"}
    else
        render json: {error: "book not found for delete"}
    end
end


def publish_book
   
    if @book.present?
        @book.update_columns(status: "published")
        render json: @book , message: 'Book is published'
    else
        render json: {error: 'book not found' }
    end
end


 def all_publish_book
    all_book = Book.where(status: "published")
    render json: all_book
 end


 def all_draft_book
    all_book = Book.where(status: "draft")
    render json: all_book
 end




private


def get_book
    @book = current_user.books.find_by(id: params[:id])
end

def book_params
params.require(:books).permit(:title,:description,:user_id,:status)
end


end
