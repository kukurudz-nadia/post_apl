class UserSerializer < ActiveModel::Serializer
  attributes  :id, :nickname, :email
  has_many :posts
end