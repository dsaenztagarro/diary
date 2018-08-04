# frozen_string_literal: true

class Workout < ApplicationRecord
  validates_presence_of :name
  has_many :exercises

  def build_workout_execution
    WorkoutExecution.new do |we|

    end
  end
end
