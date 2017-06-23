class Like < ApplicationRecord
  belongs_to :interested_user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :liked_document, class_name: 'Document', foreign_key: 'document_id'
end
