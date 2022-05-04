class FixAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column :warehouses, :adress, :address
  end
end
