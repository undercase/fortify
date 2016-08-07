class WorkoutsController < ApplicationController
  before_action :authorize

  def index
    @workout = current_user.workouts.new
    @workouts = current_user.workouts.where.not(id: @workout.id)
  end

  def show
    @workout = Workout.find(params[:id])
    @exercise = @workout.exercises.new(rest: false)
    @rest = @workout.exercises.new(name: nil, reps: nil, sets: nil, rest: true)
    @exercises = @workout.exercises.where.not(id: [@exercise.id, @rest.id]).order(created_at: :asc)
  end

  def create
    @workout = current_user.workouts.create(workout_params)
    @workout.update_attributes(days: 0)
    redirect_to workouts_path
  end

  protected
    def workout_params
      params.require(:workout).permit(:name, :days)
    end
end
