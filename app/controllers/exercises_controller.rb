class ExercisesController < ApplicationController
  before_action :authorize

  def create
    @workout = Workout.find(params[:workout_id])
    rest_time = params[:exercise][:minutes]
    minutes, seconds = nil, nil
    if rest_time.split(':').size == 1
      # Check if positive number
      if not !/\A\d+\z/.match(rest_time)
        if Integer(rest_time) < 60
          minutes = 0
          seconds = Integer(rest_time)
        end
      end
    elsif rest_time.split(':').size == 2
      rest_time = rest_time.split(':')
      if not !/\A\d+\z/.match(rest_time[0])
        if Integer(rest_time[0]) < 60
          minutes = Integer(rest_time[0])
        end
      end
      if not !/\A\d+\z/.match(rest_time[1])
        if Integer(rest_time[1]) < 60
          seconds = Integer(rest_time[1])
        end
      end
    end
    if minutes.nil? || seconds.nil?
      @exercise = Exercise.new(exercise_params)
      @exercise.errors.messages.store('Rest Time', 'was formatted incorrectly')
      @rest = @workout.exercises.new(name: nil, reps: nil, sets: nil, rest: true)
      @exercises = @workout.exercises.where.not(id: [@exercise.id, @rest.id]).order(created_at: :asc)
      render 'workouts/show'
    else
      @exercise = @workout.exercises.create(exercise_params.merge(minutes: minutes, seconds: seconds))
      redirect_to workout_path(@workout)
    end
  end
  
  def destroy
    @workout = Workout.find(params[:workout_id])
    if @workout.user == current_user
      @exercise = Exercise.find(params[:id])
      @exercise.destroy
    else
      redirect_to root_path
    end
  end

  protected
    def exercise_params
      params.require(:exercise).permit(:rest, :name, :sets, :reps, :minutes)
    end
end
