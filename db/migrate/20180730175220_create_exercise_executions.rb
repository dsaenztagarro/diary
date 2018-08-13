# frozen_string_literal: true

class CreateExerciseExecutions < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_executions do |t|
      t.belongs_to :workout_execution
      t.belongs_to :exercise

      t.timestamps
    end
  end
end
