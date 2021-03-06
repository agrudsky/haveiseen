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

ActiveRecord::Schema.define(version: 20140807234943) do

  create_table "movies", force: true do |t|
    t.string   "title"
    t.string   "rating"
    t.string   "runtime"
    t.string   "poster"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "synopsis"
    t.string   "critics_rating"
    t.string   "critics_score"
    t.string   "audience_rating"
    t.string   "audience_score"
    t.string   "year"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "gender"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "watches", force: true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "movie_title"
    t.string   "username"
  end

end
