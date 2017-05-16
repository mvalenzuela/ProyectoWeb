class CreateCategoriesDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_documents do |t|
      t.references :category, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
