# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170401181944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amazon_product_histories", force: :cascade do |t|
    t.integer  "price"
    t.string   "availability"
    t.string   "condition"
    t.string   "currency_code"
    t.boolean  "prime",             default: false
    t.boolean  "super_saver",       default: false
    t.integer  "sales_rank"
    t.integer  "total_new"
    t.integer  "total_used"
    t.integer  "total_collectible"
    t.integer  "total_refurbished"
    t.integer  "amazon_product_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["amazon_product_id"], name: "index_amazon_product_histories_on_amazon_product_id", using: :btree
  end

  create_table "amazon_products", force: :cascade do |t|
    t.string   "title"
    t.string   "manufacturer"
    t.string   "brand"
    t.string   "product_group"
    t.string   "features",                                           array: true
    t.string   "product_type_name"
    t.string   "binding"
    t.boolean  "adult_product",         default: false
    t.string   "model"
    t.string   "ean"
    t.string   "upc"
    t.string   "asin"
    t.string   "parent_asin"
    t.string   "detail_page_url"
    t.string   "add_to_wishlist_url"
    t.string   "tell_a_friend_url"
    t.string   "customer_reviews_url"
    t.string   "all_offers_url"
    t.integer  "current_price"
    t.integer  "current_sales_rank"
    t.integer  "total_new"
    t.integer  "total_used"
    t.integer  "total_collectible"
    t.integer  "total_refurbished"
    t.integer  "package_quantity"
    t.string   "part_number"
    t.string   "size_of_item"
    t.string   "studio"
    t.string   "main_large_image"
    t.string   "main_medium_image"
    t.string   "main_small_image"
    t.string   "variant_large_images",                               array: true
    t.string   "variant_medium_images",                              array: true
    t.string   "variant_small_images",                               array: true
    t.string   "similar_products",                                   array: true
    t.string   "tags",                                               array: true
    t.datetime "scanned_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_foreign_key "amazon_product_histories", "amazon_products"
end
