# frozen_string_literal: true

class ExerciseExecution < ApplicationRecord
  belongs_to :workout_execution
  belongs_to :exercise
  delegate :name, to: :exercise
end
