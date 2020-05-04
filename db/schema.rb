ActiveRecord::Schema.define(version: 2020_04_30_092654) do
  create_table "rents", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "address"
    t.integer "age"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "route"
    t.string "station_name"
    t.integer "walk_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rent_id"
    t.index ["rent_id"], name: "index_stations_on_rent_id"
  end
end
