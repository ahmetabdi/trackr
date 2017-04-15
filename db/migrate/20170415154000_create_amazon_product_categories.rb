class CreateAmazonProductCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :amazon_product_categories do |t|
      t.string :name
    end
  end
end
