# frozen_string_literal: true

class Workout < ApplicationRecord
  belongs_to :planned_workout
  has_many :exercises, dependent: :destroy
  delegate :name, to: :planned_workout
  accepts_nested_attributes_for :exercises

  def self.from(planned_workout)
    new(planned_workout: planned_workout).tap do |workout|
      planned_workout.planned_exercises.includes(:exercise_type).each do |planned_exercise|
        exercise = workout.exercises.build(planned_exercise: planned_exercise, order: planned_exercise.order)

        planned_exercise.metadata_keys.each do |metadata_key|
          exercise.metadatums.build(metadata_key: metadata_key)
        end
      end
    end
  end
end
