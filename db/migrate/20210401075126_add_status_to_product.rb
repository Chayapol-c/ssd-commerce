class AddStatusToProduct < ActiveRecord::Migration[6.1]
  def change
      add_column :products, :status, :integer, null: false, default: 0
      #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
