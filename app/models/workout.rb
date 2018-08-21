# frozen_string_literal: true

class Workout < ApplicationRecord
  belongs_to :workout_routine
  has_many :workout_exercises
  delegate :name, to: :workout_routine
  accepts_nested_attributes_for :workout_exercises

  def exercises
    workout_exercises
  end
end
