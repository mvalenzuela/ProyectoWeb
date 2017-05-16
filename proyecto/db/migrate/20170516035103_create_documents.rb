class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :text
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
