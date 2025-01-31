# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2025_01_03_212514) do
  create_table "fights", force: :cascade do |t|
    t.integer "attacker_id", null: false
    t.integer "defender_id", null: false
    t.integer "winner_id"
    t.integer "loser_id"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "defender_item_id"
    t.integer "attacker_item_id"
    t.index ["attacker_id"], name: "index_fights_on_attacker_id"
    t.index ["defender_id"], name: "index_fights_on_defender_id"
    t.index ["loser_id"], name: "index_fights_on_loser_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "health_point", default: 50
    t.integer "attack", default: 10
    t.integer "dexterity", default: 10
    t.integer "intelligence", default: 10
    t.integer "experience", default: 0
    t.integer "level", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shields", force: :cascade do |t|
    t.string "name"
    t.integer "defense"
    t.integer "require_dexterity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "damage"
    t.integer "require_dexterity"
    t.integer "require_intelligence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
