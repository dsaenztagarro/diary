# frozen_string_literal: true

class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :update]

  def index
    @workouts = Workout.all
  end

  def show
  end

  def new
    routine = WorkoutRoutine.first
    @workout = Workout.from(routine)
  end

  def create
    @workout = Workout.new(allowed_params)
    if @workout.save
      flash[:success] = "The workout was created with success"
      redirect_to workouts_path
    else
      render :new
    end
  end

  def update
    @workout.assign_attributes(allowed_params)

    if @workout.save
      flash[:success] = "The workout was updated with success"
      redirect_to workouts_path
    else
      render :edit
    end
  end

  private

    def allowed_params
      params.require(:workout).permit(
        :id,
        :workout_routine_id,
        workout_exercises_attributes: [
          :workout_routine_exercise_id,
          metadatums_attributes: [:metadata_key_id, :value]
        ]
      )
    end

    def find_workout
      @workout = Workout.find(params[:id])
    end
end
