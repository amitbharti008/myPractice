class UserSerializer < ActiveModel::Serializer
  attributes :id,:first_name,:last_name,:email,:active,:token
  has_many :orders
end
