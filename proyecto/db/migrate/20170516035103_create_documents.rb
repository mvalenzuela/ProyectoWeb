class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :text
      t.boolean :public

      t.timestamps
    end
  end
end
