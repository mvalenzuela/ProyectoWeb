class Document < ApplicationRecord
  has_many :categories_documents
  has_many :categories, through: :categories_documents

  has_many :edit_permissions
  has_many :permited_to_edit_users, through: :edit_permissions

  has_many :likes
  has_many :interested_users, through: :likes

  validates :title, {
      length: { minimum: 10,  maximum: 50 },
      presence: true,
      uniqueness: true,
    }

    validates :text, {
      length: { minimum: 10},
      presence: true,
    }
end
