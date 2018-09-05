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

ActiveRecord::Schema.define(version: 2018_08_22_190200) do

  create_table "exercise_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "metadata_group_id"
    t.index ["metadata_group_id"], name: "index_exercise_types_on_metadata_group_id"
  end

  create_table "exercises", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.bigint "planned_exercise_id", null: false
    t.integer "order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planned_exercise_id"], name: "index_exercises_on_planned_exercise_id"
    t.index ["workout_id", "order"], name: "index_exercises_on_workout_id_and_order", unique: true
    t.index ["workout_id", "planned_exercise_id"], name: "index_exercises_on_workout_id_and_planned_exercise_id", unique: true
    t.index ["workout_id"], name: "index_exercises_on_workout_id"
  end

  create_table "metadata", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "metadata_key_id"
    t.bigint "exercise_id"
    t.string "value"
    t.index ["exercise_id"], name: "index_metadata_on_exercise_id"
    t.index ["metadata_key_id"], name: "index_metadata_on_metadata_key_id"
  end

  create_table "metadata_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "metadata_keys", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "metadata_group_id", null: false
    t.index ["metadata_group_id"], name: "index_metadata_keys_on_metadata_group_id"
  end

  create_table "planned_exercises", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "planned_workout_id", null: false
    t.bigint "exercise_type_id", null: false
    t.integer "order", null: false
    t.integer "sets"
    t.integer "repetitions"
    t.string "rest"
    t.index ["exercise_type_id"], name: "index_planned_exercises_on_exercise_type_id"
    t.index ["planned_workout_id"], name: "index_planned_exercises_on_planned_workout_id"
  end

  create_table "planned_workouts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "planned_workout_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planned_workout_id"], name: "index_workouts_on_planned_workout_id"
  end

  add_foreign_key "metadata", "exercises"
  add_foreign_key "metadata", "metadata_keys"
end
