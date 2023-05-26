module BlogModule
class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true


    validates :content,presence: { message: "can't be blank" }
    validates :commentable_type, presence: { message: "can't be blank" }
    validates :commentable_id, presence: { message: "can't be blank" }
end
end
