# frozen_string_literal: true

require "test_helper"

class PlannedExerciseTest < ActiveSupport::TestCase
  test "uniqueness of exercise type per planned workout" do
    planned_workout = PlannedWorkout.first

    planned_exercise = planned_workout.exercises.first
    assert_equal "Lumbar spine movement", planned_exercise.name

    exercise_type = ExerciseType.where(name: "Lumbar spine movement").first

    planned_workout.planned_exercise.create(exercise_type_id: exercise_type.id, order: planned_workout.planned_exercises.size)

    debugger

    assert_equal 1, planned_workout.errors.size
  end
end
