class Post < ApplicationRecord
  belongs_to :user
  validates :title, :message, :status, :user_id, presence: true
  validates :message, length: {maximum: 300}
end
