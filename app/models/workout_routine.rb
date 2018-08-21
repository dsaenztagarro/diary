# frozen_string_literal: true

class WorkoutRoutine < ApplicationRecord
  has_many :workout_routine_exercises
  has_many :workouts
  validates_presence_of :name

  def build_workout
    workouts.new.tap do |workout|
      workout_routine_exercises.includes(:exercise_type).each do |exercise|
        workout.workout_exercises.build(workout_routine_exercise: exercise)
      end
    end
  end
end
