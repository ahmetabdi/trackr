class AddSlugToAmazonProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :amazon_products, :slug, :string
    add_index :amazon_products, :slug, unique: true
  end
end
