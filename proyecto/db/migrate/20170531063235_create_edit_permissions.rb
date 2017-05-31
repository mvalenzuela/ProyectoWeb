class CreateEditPermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :edit_permissions do |t|
      t.references :document, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
