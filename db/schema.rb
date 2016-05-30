# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160530155507) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id", limit: 4
  end

  add_index "categories", ["category_id"], name: "index_categories_on_category_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "price_id",   limit: 4
    t.integer  "user_id",    limit: 4
  end

  add_index "comments", ["price_id"], name: "index_comments_on_price_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "prices", force: :cascade do |t|
    t.text     "image",      limit: 65535
    t.float    "price",      limit: 24
    t.text     "address",    limit: 65535
    t.float    "longitude",  limit: 24
    t.float    "latitude",   limit: 24
    t.float    "avg_rating", limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
  end

  add_index "prices", ["product_id"], name: "index_prices_on_product_id", using: :btree
  add_index "prices", ["user_id"], name: "index_prices_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.text     "barcode",     limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "category_id", limit: 4
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "rate",       limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "price_id",   limit: 4
    t.integer  "user_id",    limit: 4
  end

  add_index "rates", ["price_id"], name: "index_rates_on_price_id", using: :btree
  add_index "rates", ["user_id"], name: "index_rates_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "image",                  limit: 255
    t.integer  "phone",                  limit: 4
    t.string   "gender",                 limit: 255
    t.date     "dob"
    t.string   "avatar",                 limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "categories", "categories"
  add_foreign_key "comments", "prices"
  add_foreign_key "comments", "users"
  add_foreign_key "prices", "products"
  add_foreign_key "prices", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "rates", "prices"
  add_foreign_key "rates", "users"
end