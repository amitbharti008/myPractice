class Book < ApplicationRecord

    belongs_to :user

    validates :title, presence: { message: "can't be blank" }
    validates :description, presence: { message: "can't be blank" }


    after_create :update_status



    def update_status
        update_columns(status: "draft")
    end
end
