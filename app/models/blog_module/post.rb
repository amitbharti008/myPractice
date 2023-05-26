module BlogModule
class Post < ApplicationRecord
    has_many :comments, as: :commentable
end
end
