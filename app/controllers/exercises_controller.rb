class ExercisesController < ApplicationController
  before_action :authorize

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.create(exercise_params)
    redirect_to workout_path(@workout)
  end
  
  def delete
    @workout = Workout.find(params[:workout_id])
    if @workout.user == current_user
      @exercise = Exercise.find(params[:id])
      @exercise.destroy
      redirect_to workout_path(@workout)
    else
      redirect_to root_path
    end
  end

  protected
    def exercise_params
      params.require(:exercise).permit(:rest, :name, :sets, :reps, :rest_time)
    end
end
