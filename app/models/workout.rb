# frozen_string_literal: true

class Workout < ApplicationRecord
  validates_presence_of :name
  has_many :exercises
  has_many :workout_executions

  def build_workout_execution
    workout_executions.new.tap do |we|
      exercises.includes(:exercise_type).each do |exercise|
        we.exercise_executions.build(exercise: exercise)
      end
    end
  end
end
