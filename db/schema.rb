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

ActiveRecord::Schema.define(version: 2018_07_30_175220) do

  create_table "exercise_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workout_exercises", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "workout_id"
    t.bigint "workout_routine_exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_id"], name: "index_workout_exercises_on_workout_id"
    t.index ["workout_routine_exercise_id"], name: "index_workout_exercises_on_workout_routine_exercise_id"
  end

  create_table "workout_routine_exercises", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "workout_routine_id"
    t.bigint "exercise_type_id"
    t.integer "order"
    t.integer "sets"
    t.integer "repetitions"
    t.string "tempo"
    t.string "rest"
    t.index ["exercise_type_id"], name: "index_workout_routine_exercises_on_exercise_type_id"
    t.index ["workout_routine_id"], name: "index_workout_routine_exercises_on_workout_routine_id"
  end

  create_table "workout_routines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "workout_routine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_routine_id"], name: "index_workouts_on_workout_routine_id"
  end

end
