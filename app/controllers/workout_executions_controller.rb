# frozen_string_literal: true

class WorkoutExecutionsController < ApplicationController
  def index
    @workout_executions = WorkoutExecution.all
  end

  def new
    workout = Workout.first
    @workout_execution = workout.build_workout_execution
  end

  def create
    @workout_execution = WorkoutExecution.new(workout_execution_params)
    if @workout_execution.save
      flash[:success] = "The workout execution was created with success"
      redirect_to workout_executions_path
    else
      debugger
      render :new
    end
  end

  private

    def workout_execution_params
      params.require(:workout_execution).permit(:workout_id, :exercise_executions)
    end
end
