# frozen_string_literal: true

require "test_helper"

class WorkoutTest < ActiveSupport::TestCase
  test ".from" do
    routine = WorkoutRoutine.first

    workout = Workout.from(routine)

    assert_instance_of Workout, workout
    assert_equal 2, workout.workout_exercises.size
  end
end
