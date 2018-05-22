class AddLocationsToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :long, :decimal, {:precision=>10, :scale=>6}
    add_column :organizations, :lat, :decimal, {:precision=>10, :scale=>6}
  end
end
