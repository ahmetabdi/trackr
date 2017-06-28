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

ActiveRecord::Schema.define(version: 20170627073831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amazon_product_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.index ["slug"], name: "index_amazon_product_categories_on_slug", unique: true
  end

  create_table "amazon_product_groups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.index ["slug"], name: "index_amazon_product_groups_on_slug", unique: true
  end

  create_table "amazon_product_histories", id: :serial, force: :cascade do |t|
    t.integer "price"
    t.string "availability"
    t.string "condition"
    t.string "currency_code"
    t.boolean "prime", default: false
    t.boolean "super_saver", default: false
    t.integer "sales_rank"
    t.integer "total_new"
    t.integer "total_used"
    t.integer "total_collectible"
    t.integer "total_refurbished"
    t.integer "amazon_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amazon_product_id"], name: "index_amazon_product_histories_on_amazon_product_id"
  end

  create_table "amazon_products", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "manufacturer"
    t.string "brand"
    t.string "features", array: true
    t.string "product_type_name"
    t.boolean "adult_product", default: false
    t.string "model"
    t.string "ean"
    t.string "upc"
    t.string "asin"
    t.string "parent_asin"
    t.string "detail_page_url"
    t.string "add_to_wishlist_url"
    t.string "tell_a_friend_url"
    t.string "customer_reviews_url"
    t.string "all_offers_url"
    t.integer "current_price"
    t.integer "current_sales_rank"
    t.integer "total_new"
    t.integer "total_used"
    t.integer "total_collectible"
    t.integer "total_refurbished"
    t.integer "package_quantity"
    t.string "part_number"
    t.string "size_of_item"
    t.string "studio"
    t.string "main_large_image"
    t.string "main_medium_image"
    t.string "main_small_image"
    t.string "variant_large_images", array: true
    t.string "variant_medium_images", array: true
    t.string "variant_small_images", array: true
    t.string "similar_products", array: true
    t.string "tags", array: true
    t.datetime "scanned_at"
    t.integer "amazon_product_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "amazon_product_category_id"
    t.boolean "current_prime", default: false
    t.boolean "current_super_saver", default: false
    t.integer "percentage_to_save", default: 0
    t.index ["amazon_product_category_id"], name: "index_amazon_products_on_amazon_product_category_id"
    t.index ["amazon_product_group_id"], name: "index_amazon_products_on_amazon_product_group_id"
    t.index ["slug"], name: "index_amazon_products_on_slug", unique: true
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "watch_lists", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "amazon_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amazon_product_id"], name: "index_watch_lists_on_amazon_product_id"
    t.index ["user_id"], name: "index_watch_lists_on_user_id"
  end

  add_foreign_key "amazon_product_histories", "amazon_products"
  add_foreign_key "amazon_products", "amazon_product_categories"
  add_foreign_key "amazon_products", "amazon_product_groups"
  add_foreign_key "watch_lists", "amazon_products"
  add_foreign_key "watch_lists", "users"
end
