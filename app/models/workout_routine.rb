# frozen_string_literal: true

class WorkoutRoutine < ApplicationRecord
  has_many :workout_routine_exercises
  has_many :workouts
  validates_presence_of :name
end
