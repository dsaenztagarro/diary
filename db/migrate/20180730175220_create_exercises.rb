# frozen_string_literal: true

class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.belongs_to :workout, null: false
      t.belongs_to :planned_exercise, null: false
      t.integer :order, null: false

      t.timestamps
    end

    add_index :exercises, [:workout_id, :planned_exercise_id], unique: true
    add_index :exercises, [:workout_id, :order], unique: true
  end
end
