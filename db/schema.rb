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

ActiveRecord::Schema.define(version: 20160618070506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "load_funds_transactions", force: :cascade do |t|
    t.integer  "amount_centavos", default: 0,     null: false
    t.string   "amount_currency", default: "BRL", null: false
    t.integer  "wallet_id",                       null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "load_funds_transactions", ["wallet_id"], name: "index_load_funds_transactions_on_wallet_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wallets", force: :cascade do |t|
    t.integer  "balance_centavos", default: 0,     null: false
    t.string   "balance_currency", default: "BRL", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                          null: false
  end

  add_index "wallets", ["user_id"], name: "index_wallets_on_user_id", using: :btree

  add_foreign_key "load_funds_transactions", "wallets"
  add_foreign_key "wallets", "users"
end
