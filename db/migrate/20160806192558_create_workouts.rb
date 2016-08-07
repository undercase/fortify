class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :days
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
