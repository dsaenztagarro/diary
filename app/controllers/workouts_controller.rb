# frozen_string_literal: true

class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def new
    routine = WorkoutRoutine.first
    @workout = routine.build_workout
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      flash[:success] = "The workout was created with success"
      redirect_to workouts_path
    else
      render :new
    end
  end

  private

    def workout_params
      params.require(:workout).permit(:workout_routine_id, :workout_exercises)
    end
end
