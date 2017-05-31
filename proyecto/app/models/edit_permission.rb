class EditPermission < ApplicationRecord
  belongs_to :permited_to_edit_user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :document
end
