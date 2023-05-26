module BlogModule
class Forum < ApplicationRecord
    has_many :comments, as: :commentable
end
end
