class RemoveDaysFromWorkouts < ActiveRecord::Migration[5.0]
  def change
    remove_column :workouts, :days, :integer
  end
end
