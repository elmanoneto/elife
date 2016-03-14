class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = Workout.all
    render json: @workouts, status: 202
  end

  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      render json: {success: @workout}, status: 202
    else
      render json: {error: @workout.errors}, status: :unprocessable_entity
    end
  end

  def new
    @workout = Workout.new
  end

  def destroy
    if @workout.destroy
      render json: {success: 'Removed'}, status: 202
    else
      render json: {error: @workout.errors}, status: :unprocessable_entity
    end
  end

  def site
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_workout
    @workout = Workout.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def workout_params
    params.require(:workout).permit(:time, :date, :type)
  end
end
