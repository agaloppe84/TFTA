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

ActiveRecord::Schema.define(version: 20160309140843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.integer  "attachinariable_id"
    t.string   "attachinariable_type"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree

  create_table "culinary_styles", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price_cents",  default: 0, null: false
    t.string   "photo"
    t.string   "category"
    t.boolean  "gluten"
    t.boolean  "bio"
    t.boolean  "vegetarien"
    t.integer  "foodtruck_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "dishes", ["foodtruck_id"], name: "index_dishes_on_foodtruck_id", using: :btree

  create_table "foodtrucks", force: :cascade do |t|
    t.string   "sku"
    t.string   "name"
    t.string   "format"
    t.integer  "min_capacity"
    t.integer  "max_capacity"
    t.integer  "free_radius_max"
    t.integer  "radius_max"
    t.integer  "km_price_cents",    default: 0, null: false
    t.string   "address"
    t.integer  "user_id"
    t.integer  "culinary_style_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "foodtrucks", ["culinary_style_id"], name: "index_foodtrucks_on_culinary_style_id", using: :btree
  add_index "foodtrucks", ["user_id"], name: "index_foodtrucks_on_user_id", using: :btree

  create_table "menu_dishes", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "menu_dishes", ["dish_id"], name: "index_menu_dishes_on_dish_id", using: :btree
  add_index "menu_dishes", ["menu_id"], name: "index_menu_dishes_on_menu_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price_cents",  default: 0, null: false
    t.string   "photo"
    t.integer  "foodtruck_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
  end

  add_index "menus", ["foodtruck_id"], name: "index_menus_on_foodtruck_id", using: :btree
  add_index "menus", ["user_id"], name: "index_menus_on_user_id", using: :btree

  create_table "order_lines", force: :cascade do |t|
    t.integer  "number_of_meals"
    t.integer  "menu_price_cents", default: 0, null: false
    t.integer  "reservation_id"
    t.integer  "menu_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "order_lines", ["menu_id"], name: "index_order_lines_on_menu_id", using: :btree
  add_index "order_lines", ["reservation_id"], name: "index_order_lines_on_reservation_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.string   "review"
    t.integer  "mark"
    t.integer  "payment_cents",  default: 0,         null: false
    t.string   "address"
    t.string   "accepted_at"
    t.string   "refused_at"
    t.integer  "user_id"
    t.integer  "foodtruck_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.datetime "shift_datetime"
    t.string   "status",         default: "pending"
  end

  add_index "reservations", ["foodtruck_id"], name: "index_reservations_on_foodtruck_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "age"
    t.string   "address"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "trucker"
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "token"
    t.datetime "token_expiry"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "dishes", "foodtrucks"
  add_foreign_key "foodtrucks", "culinary_styles"
  add_foreign_key "foodtrucks", "users"
  add_foreign_key "menu_dishes", "dishes"
  add_foreign_key "menu_dishes", "menus"
  add_foreign_key "menus", "foodtrucks"
  add_foreign_key "menus", "users"
  add_foreign_key "order_lines", "menus"
  add_foreign_key "order_lines", "reservations"
  add_foreign_key "reservations", "foodtrucks"
  add_foreign_key "reservations", "users"
end
