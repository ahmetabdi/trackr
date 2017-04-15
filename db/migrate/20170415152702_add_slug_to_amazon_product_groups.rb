class AddSlugToAmazonProductGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :amazon_product_groups, :slug, :string
    add_index :amazon_product_groups, :slug, unique: true
  end
end
