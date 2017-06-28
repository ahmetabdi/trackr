class CreateWatchList < ActiveRecord::Migration[5.1]
  def change
    create_table :watch_lists do |t|
      t.references :user, foreign_key: true
      t.references :amazon_product, foreign_key: true
      t.timestamps
    end
  end
end
