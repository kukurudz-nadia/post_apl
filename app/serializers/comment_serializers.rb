class CommentSerializer < ActiveModel::Serializer
   attributes  :message, :user_id
end