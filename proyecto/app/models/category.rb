class Category < ApplicationRecord
  has_many :categories_documents
  has_many :categories, through: :categories_documents

  validates :title, {
    length: { minimum: 3,  maximum: 30 },
    presence: true,
    uniqueness: true,
  }

end
