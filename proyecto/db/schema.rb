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

ActiveRecord::Schema.define(version: 20170622015413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_documents", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_categories_documents_on_category_id", using: :btree
    t.index ["document_id"], name: "index_categories_documents_on_document_id", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "public"
  end

  create_table "edit_permissions", force: :cascade do |t|
    t.integer  "document_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["document_id"], name: "index_edit_permissions_on_document_id", using: :btree
    t.index ["user_id"], name: "index_edit_permissions_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["document_id"], name: "index_likes_on_document_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "suggestions", force: :cascade do |t|
    t.integer  "document_id"
    t.integer  "user_id"
    t.string   "text"
    t.string   "status",      default: "Pending"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["document_id"], name: "index_suggestions_on_document_id", using: :btree
    t.index ["user_id"], name: "index_suggestions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "categories_documents", "categories"
  add_foreign_key "categories_documents", "documents"
  add_foreign_key "edit_permissions", "documents"
  add_foreign_key "edit_permissions", "users"
  add_foreign_key "likes", "documents"
  add_foreign_key "likes", "users"
  add_foreign_key "suggestions", "documents"
  add_foreign_key "suggestions", "users"
end
