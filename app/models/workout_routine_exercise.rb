# frozen_string_literal: true

class WorkoutRoutineExercise < ApplicationRecord
  belongs_to :workout_routine
  belongs_to :exercise_type
  delegate :name, to: :exercise_type
end
