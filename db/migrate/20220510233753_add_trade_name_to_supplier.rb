class AddTradeNameToSupplier < ActiveRecord::Migration[7.0]
  def change
    add_column :suppliers, :trade_name, :string
  end
end
