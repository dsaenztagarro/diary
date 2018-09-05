# frozen_string_literal: true

class CreatePlannedWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :planned_workouts do |t|
      t.string :name

      t.timestamps
    end
  end
end
