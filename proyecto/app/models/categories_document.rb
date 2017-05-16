class CategoriesDocument < ApplicationRecord
  belongs_to :category
  belongs_to :document
end
