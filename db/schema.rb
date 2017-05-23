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

ActiveRecord::Schema.define(version: 20170523231126) do

  create_table "charger_intervals", force: :cascade do |t|
    t.integer "time_interval_id"
    t.float "max_pv_volts"
    t.float "max_charge_amps"
    t.float "charge_amp_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_intervals", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.float "time_period"
    t.float "max_total_charge_amps"
    t.float "battery_volts_max"
    t.float "battery_volts_min"
    t.float "accept_charge_time"
    t.float "float_charge_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
