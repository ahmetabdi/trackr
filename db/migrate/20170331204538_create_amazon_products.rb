class CreateAmazonProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :amazon_products do |t|
      t.string :title
      # <Title>Cellucor C4 50x Pre Workout Powder, Extreme Energy, Icy Blue Razz 45 Servings (405g)</Title>
      t.string :manufacturer
      # <Manufacturer>Cellucor</Manufacturer>
      t.string :brand
      # <Brand>Cellucor</Brand>
      t.string :features, array: true
      # <Feature>Stronger than C4 by 50%</Feature>
      # <Feature>Contains 50% more of what you love</Feature>
      # <Feature>The hardest hitting preworkout Cellucor has ever made</Feature>
      # <Feature>Nicotine Free, 0mg Nicotine</Feature>
      t.string :product_type_name
      # <ProductTypeName>HEALTH_PERSONAL_CARE</ProductTypeName>
      t.boolean :adult_product, default: false
      # <IsAdultProduct>0</IsAdultProduct>
      t.string :model
      # <Model>CLC1027/101/102</Model>
      t.string :ean
      # <EAN>0810390026425</EAN>
      t.string :upc
      # <UPC>810390026425</UPC>
      t.string :asin
      t.string :parent_asin

      t.string :detail_page_url
      t.string :add_to_wishlist_url
      t.string :tell_a_friend_url
      t.string :customer_reviews_url
      t.string :all_offers_url
      # <ASIN>B01AX72ZTI</ASIN>

      t.integer :current_price
      t.integer :current_sales_rank

      t.integer :total_new
      t.integer :total_used
      t.integer :total_collectible
      t.integer :total_refurbished
      t.integer :package_quantity

      t.string :part_number
      t.string :size_of_item
      t.string :studio

      t.string :main_large_image
      t.string :main_medium_image
      t.string :main_small_image

      t.string :variant_large_images, array: true
      t.string :variant_medium_images, array: true
      t.string :variant_small_images, array: true

      t.string :similar_products, array: true
      # SimilarProducts (array of asins)
      t.string :tags, array: true
      # BrowseNodes (Use these as tags)

      t.datetime :scanned_at
      t.references :amazon_product_group, foreign_key: true
      t.timestamps
    end
  end
end

