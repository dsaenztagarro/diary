# frozen_string_literal: true

class WorkoutExecution < ApplicationRecord
  belongs_to :workout
  has_many :exercise_executions
  delegate :name, to: :workout
  accepts_nested_attributes_for :exercise_executions
end
