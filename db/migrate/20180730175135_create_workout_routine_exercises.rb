# frozen_string_literal: true

class CreateWorkoutRoutineExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_routine_exercises do |t|
      t.belongs_to :workout_routine
      t.belongs_to :exercise_type
      t.integer :order
      t.integer :sets
      t.integer :repetitions
      t.string :tempo
      t.string :rest
    end
  end
end
