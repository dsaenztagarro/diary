# frozen_string_literal: true

class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.belongs_to :workout
      t.belongs_to :exercise_type
      t.integer :order
      t.integer :sets
      t.integer :repetitions
      t.string :tempo
      t.string :rest
    end
  end
end
