class Comment < ApplicationRecord
  belongs_to :user
  validates :message, :user_id, presence: true
end
