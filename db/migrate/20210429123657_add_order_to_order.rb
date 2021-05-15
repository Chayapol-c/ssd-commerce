class AddOrderToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :address, :sting, null: false, default: ""
  end
end
