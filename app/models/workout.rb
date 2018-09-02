# frozen_string_literal: true

class Workout < ApplicationRecord
  belongs_to :workout_routine
  has_many :workout_exercises
  delegate :name, to: :workout_routine
  accepts_nested_attributes_for :workout_exercises

  def self.from(routine)
    new(workout_routine: routine).tap do |workout|
      routine.workout_routine_exercises.includes(:exercise_type).each do |exercise|
        workout_exercise = workout.workout_exercises.build(workout_routine_exercise: exercise)
        if metadata_group = exercise.exercise_type.metadata_group
          metadata_group.metadata_keys.each do |metadata_key|
            workout_exercise.metadatums.build(metadata_key: metadata_key)
          end
        end
      end
    end
  end
end
