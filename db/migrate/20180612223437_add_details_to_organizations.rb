class AddDetailsToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :email, :string
    add_column :organizations, :website, :string
    add_column :organizations, :dropoff_hours, :string
  end
end
