class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :poc_name
      t.string :phone

      t.timestamps
    end
  end
end
