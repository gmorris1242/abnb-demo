# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_11_204525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hosts", force: :cascade do |t|
    t.string "host_number"
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.string "picture_url"
    t.string "thumbnail_url"
    t.text "about"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "host_id"
    t.string "name"
    t.string "localized_city"
    t.string "airbnb_listing_id_str"
    t.string "picture_url"
    t.string "nightly_price_as_guest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "calendar"
    t.index ["host_id"], name: "index_listings_on_host_id"
  end

end
