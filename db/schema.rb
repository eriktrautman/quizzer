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

ActiveRecord::Schema.define(version: 20131013012559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_views", force: true do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.integer  "view_count"
    t.integer  "pass_count"
    t.integer  "fail_count"
    t.integer  "urgency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "card_views", ["card_id", "user_id"], name: "index_card_views_on_card_id_and_user_id", unique: true, using: :btree
  add_index "card_views", ["card_id"], name: "index_card_views_on_card_id", using: :btree
  add_index "card_views", ["user_id"], name: "index_card_views_on_user_id", using: :btree

  create_table "cards", force: true do |t|
    t.integer  "category_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["category_id"], name: "index_cards_on_category_id", using: :btree
  add_index "cards", ["title"], name: "index_cards_on_title", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree

  create_table "quiz_categories", force: true do |t|
    t.integer  "quiz_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_categories", ["category_id"], name: "index_quiz_categories_on_category_id", using: :btree
  add_index "quiz_categories", ["quiz_id", "category_id"], name: "index_quiz_categories_on_quiz_id_and_category_id", unique: true, using: :btree
  add_index "quiz_categories", ["quiz_id"], name: "index_quiz_categories_on_quiz_id", using: :btree

  create_table "quizzes", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quizzes", ["name"], name: "index_quizzes_on_name", unique: true, using: :btree
  add_index "quizzes", ["user_id"], name: "index_quizzes_on_user_id", using: :btree

  create_table "user_category_queues", force: true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.text     "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_category_queues", ["category_id", "user_id"], name: "index_user_category_queues_on_category_id_and_user_id", unique: true, using: :btree
  add_index "user_category_queues", ["category_id"], name: "index_user_category_queues_on_category_id", using: :btree
  add_index "user_category_queues", ["user_id"], name: "index_user_category_queues_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
