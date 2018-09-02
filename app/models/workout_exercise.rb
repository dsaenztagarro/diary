# frozen_string_literal: true

class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :workout_routine_exercise
  has_many :metadatums
  delegate :name, to: :workout_routine_exercise
  accepts_nested_attributes_for :metadatums
end
