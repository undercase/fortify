class ExercisesController < ApplicationController
  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.create(exercise_params)
    redirect_to workout_path(@workout)
  end
  protected
    def exercise_params
      params.require(:exercise).permit(:rest, :name, :sets, :reps, :rest_time)
    end
end
