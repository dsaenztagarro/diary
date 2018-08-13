# frozen_string_literal: true

class CreateWorkoutExecutions < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_executions do |t|
      t.string :name
      t.belongs_to :workout

      t.timestamps
    end
  end
end
