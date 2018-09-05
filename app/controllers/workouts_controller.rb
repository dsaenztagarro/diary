# frozen_string_literal: true

class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :update]

  def index
    @workouts = Workout.all
  end

  def show
  end

  def new
    planned_workout = PlannedWorkout.first
    @workout = Workout.from(planned_workout)
  end

  def create
    @workout = Workout.new(allowed_params)
    if @workout.save
      flash[:notice] = "The workout was created with success"
      redirect_to workouts_path
    else
      render :new
    end
  end

  def update
    @workout.assign_attributes(allowed_params)

    if @workout.save
      flash[:notice] = "The workout was updated with success"
      redirect_to workouts_path
    else
      render :edit
    end
  end

  private

    def allowed_params
      params.require(:workout).permit(
        :id,
        :planned_workout_id,
        exercises_attributes: [
          :id,
          :planned_exercise_id,
          :order,
          metadatums_attributes: [:id, :metadata_key_id, :value]
        ]
      )
    end

    def find_workout
      @workout = Workout.find(params[:id])
    end
end
