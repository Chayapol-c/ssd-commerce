class AddAddressToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :address, :string, null: false, default: ""
  end
end
