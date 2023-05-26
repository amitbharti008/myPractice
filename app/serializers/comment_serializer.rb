class CommentSerializer < ActiveModel::Serializer
  attributes :id ,:content, :commentable_type, :commentable_id
  
end
