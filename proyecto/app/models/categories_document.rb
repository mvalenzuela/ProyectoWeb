class CategoriesDocument < ApplicationRecord
  belongs_to :category
  belongs_to :document

  validates_uniqueness_of :category, :scope => [:document]
end
