# frozen_string_literal: true

class PlannedExercise < ApplicationRecord
  belongs_to :planned_workout
  belongs_to :exercise_type
  validates_uniqueness_of :exercise_type_per_workout, scope: %i[planned_workout_id exercise_type_id]
  delegate :name, to: :exercise_type

  def metadata_keys
    exercise_type.metadata_group.try(:metadata_keys) || []
  end
end
