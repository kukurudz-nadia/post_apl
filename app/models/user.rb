class User < ApplicationRecord
  has_many :posts
  has_one :role
  has_many :comments
end