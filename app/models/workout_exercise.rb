# frozen_string_literal: true

class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :workout_routine_exercise
  delegate :name, to: :workout_routine_exercise
end
