# frozen_string_literal: true

class CreateExerciseTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_types do |t|
      t.string :name
    end
  end
end
