class CreateWishlists < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlists do |t|
      t.references :user, foreign_key: true
      t.references :amazon_product, foreign_key: true
    end

    add_index :wishlists, [:user_id, :amazon_product_id], unique: true
  end
end
