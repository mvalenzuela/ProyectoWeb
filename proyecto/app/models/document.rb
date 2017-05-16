class Document < ApplicationRecord
  has_many :categories_documents
  has_many :categories, through: :categories_documents

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
