class CreateAmazonProductHistory < ActiveRecord::Migration[5.0]
  def change
    create_table :amazon_product_histories do |t|
      t.integer :price
      t.integer :sales_rank
      t.references :amazon_product, foreign_key: true
      t.timestamps
    end
  end
end
