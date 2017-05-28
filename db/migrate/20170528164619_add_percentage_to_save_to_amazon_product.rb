class AddPercentageToSaveToAmazonProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :amazon_products, :percentage_to_save, :integer, default: 0
  end
end
