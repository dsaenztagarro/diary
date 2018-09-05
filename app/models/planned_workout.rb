# frozen_string_literal: true

class PlannedWorkout < ApplicationRecord
  has_many :planned_exercises, dependent: :destroy
  has_many :workouts
  validates_presence_of :name
end
