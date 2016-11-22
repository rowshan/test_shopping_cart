class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.string :product_name
      t.string :category

      t.timestamps
    end
  end
end
