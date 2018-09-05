# frozen_string_literal: true

class CreatePlannedExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :planned_exercises do |t|
      t.belongs_to :planned_workout, null: false
      t.belongs_to :exercise_type, null: false
      t.integer :order, null: false
      t.integer :sets
      t.integer :repetitions
      t.string :rest
    end
  end
end
