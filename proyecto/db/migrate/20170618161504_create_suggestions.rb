class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.references :document, foreign_key: true
      t.references :user, foreign_key: true
      t.string :text
      t.string :status, :default => "Pending"

      t.timestamps
    end
  end
end
