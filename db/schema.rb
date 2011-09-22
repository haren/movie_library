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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110922134016) do

  create_table "actors", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.float    "average_salary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "discount",   :default => 0.0
  end

  create_table "episode_items", :force => true do |t|
    t.integer  "episode_id"
    t.integer  "cart_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  create_table "episodes", :force => true do |t|
    t.string   "title"
    t.integer  "number"
    t.integer  "number_of_votes", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "series_id"
    t.integer  "rating"
    t.decimal  "price",           :default => 0.0
  end

  create_table "movie_items", :force => true do |t|
    t.integer  "movie_id"
    t.integer  "cart_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_votes",  :default => 0
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.float    "rating",           :default => 0.0
    t.decimal  "price",            :default => 0.0
  end

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",      :precision => 8, :scale => 2
  end

  create_table "role_in_a_movies", :force => true do |t|
    t.integer  "actor_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_in_an_episodes", :force => true do |t|
    t.integer  "actor_id"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", :force => true do |t|
    t.string   "title"
    t.integer  "number_of_episodes", :default => 0
    t.integer  "number_of_votes",    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.decimal  "price",              :default => 0.0
  end

end
