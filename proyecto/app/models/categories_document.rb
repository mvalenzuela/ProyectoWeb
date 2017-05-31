class CategoriesDocument < ApplicationRecord
  belongs_to :category
  belongs_to :document

  #validate :document_unique_categories?

  #def document_unique_categories?
  #  document_of_categories = CategoriesDocument.where(document: document, category: category)
  #  errors.add :end_date, document_of_categories
  #end
end
