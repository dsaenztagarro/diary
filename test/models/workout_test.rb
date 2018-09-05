# frozen_string_literal: true

require "test_helper"

class WorkoutTest < ActiveSupport::TestCase
  test "workout from planned workout" do
    planned_workout = PlannedWorkout.first

    workout = Workout.from(planned_workout)

    assert_instance_of Workout, workout
    assert_equal 3, workout.exercises.size

    exercise0, exercise1, exercise2 = workout.exercises
    assert_equal "Lumbar spine movement", exercise0.name
    assert_equal 0, exercise0.order
    assert_equal 0, exercise0.metadatums.size
    assert_equal "The plank", exercise1.name
    assert_equal 1, exercise1.order
    assert_equal 1, exercise1.metadatums.size
    assert_equal "Duration", exercise1.metadatums.first.name
    assert_equal "Side plank", exercise2.name
    assert_equal 2, exercise2.order
    assert_equal 1, exercise2.metadatums.size
    assert_equal "Duration", exercise2.metadatums.first.name
  end
end
