class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.boolean :rest
      t.string :name
      t.integer :sets
      t.integer :reps
      t.integer :minutes
      t.integer :seconds
      t.references :workout, foreign_key: true

      t.timestamps
    end
  end
end
