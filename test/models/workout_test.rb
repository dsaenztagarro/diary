# frozen_string_literal: true

require "test_helper"

class WorkoutTest < ActiveSupport::TestCase
  test "#build_workout_execution" do
    workout = Workout.first

    we = workout.build_workout_execution

    assert_instance_of WorkoutExecution, we
    assert_equal 2, we.exercise_executions.size
  end
end
