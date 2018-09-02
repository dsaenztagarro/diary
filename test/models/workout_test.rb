# frozen_string_literal: true

require "test_helper"

class WorkoutTest < ActiveSupport::TestCase
  test ".from" do
    routine = WorkoutRoutine.first

    workout = Workout.from(routine)

    assert_instance_of Workout, workout
    assert_equal 2, workout.workout_exercises.size

    exercise1, exercise2 = workout.workout_exercises
    assert_equal "Lumbar spine movement", exercise1.name
    assert_equal 0, exercise1.metadatums.size
    assert_equal "The plank", exercise2.name
    assert_equal 1, exercise2.metadatums.size

    metadatum = exercise2.metadatums.first
    assert_equal "Duration", metadatum.name
  end
end
