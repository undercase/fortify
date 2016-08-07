class WorkoutsController < ApplicationController
  before_action :authorize

  def index
    @workout = current_user.workouts.new
    @workouts = current_user.workouts.where.not(id: @workout.id)
  end

  def show
    @workout = Workout.find(params[:id])
    if @workout.user == current_user
      @exercise = @workout.exercises.new(rest: false)
      @rest = @workout.exercises.new(name: nil, reps: nil, sets: nil, rest: true)
      @exercises = @workout.exercises.where.not(id: [@exercise.id, @rest.id]).order(created_at: :asc)
    else
      redirect_to root_path
    end
  end

  def start
    @workout = Workout.find(params[:id])
    @workout.update_attributes(days: @workout.days + 1)
    redirect_to workout_path(@workout)
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
