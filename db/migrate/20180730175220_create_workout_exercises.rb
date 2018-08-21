# frozen_string_literal: true

class CreateWorkoutExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_exercises do |t|
      t.belongs_to :workout
      t.belongs_to :workout_routine_exercise

      t.timestamps
    end
  end
end