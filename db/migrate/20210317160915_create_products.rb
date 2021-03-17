class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :desc
      t.integer :stock

      t.timestamps
    end
  end
end
