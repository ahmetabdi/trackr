class AddAmazonProductCategoryToAmazonProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :amazon_products, :amazon_product_category, foreign_key: true
  end
end
