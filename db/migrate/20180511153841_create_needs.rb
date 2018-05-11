class CreateNeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :needs do |t|
      t.references :organization, foreign_key: true
      t.string :item
      t.string :category
      t.string :comment
      t.boolean :enabled, default: false, null: false

      t.timestamps
    end
  end
end
