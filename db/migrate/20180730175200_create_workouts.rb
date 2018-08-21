# frozen_string_literal: true

class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :name
      t.belongs_to :workout_routine

      t.timestamps
    end
  end
end
