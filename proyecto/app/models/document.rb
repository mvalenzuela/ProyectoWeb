class Document < ApplicationRecord
  has_many :categories_documents
  has_many :categories, through: :categories_documents
end
