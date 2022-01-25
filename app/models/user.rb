class User < ApplicationRecord
  has_many :posts
  has_one :role
  has_many :comments
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
end