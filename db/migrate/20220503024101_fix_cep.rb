class FixCep < ActiveRecord::Migration[7.0]
  def change
    rename_column :warehouses, :cep, :zip_code
  end
end
