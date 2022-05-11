class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :corporate_name
      t.string :registration_number, limit: 13
      t.string :full_address
      t.string :city
      t.string :state
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
