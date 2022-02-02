class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_one :role
  has_many :comments
  validates :login, :password, presence: true
  validates :password, uniqueness: {message: 'An account associated with %{value} already exists'}
  validates :login, uniqueness: {message: 'An account associated with %{value} already exists'}
  validates :password, length: {in: 6..15}

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
end