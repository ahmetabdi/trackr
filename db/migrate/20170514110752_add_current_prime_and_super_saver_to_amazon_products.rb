class AddCurrentPrimeAndSuperSaverToAmazonProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :amazon_products, :current_prime, :boolean, default: false
    add_column :amazon_products, :current_super_saver, :boolean, default: false
  end
end
