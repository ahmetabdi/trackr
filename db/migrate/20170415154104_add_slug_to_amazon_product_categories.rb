class AddSlugToAmazonProductCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :amazon_product_categories, :slug, :string
    add_index :amazon_product_categories, :slug, unique: true
  end
end
