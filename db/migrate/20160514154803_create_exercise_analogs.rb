class CreateExerciseAnalogs < ActiveRecord::Migration
  def change
    create_table :exercise_analogs do |t|
      t.references :exercise, index: true
      t.references :analog, index: true

      t.timestamps null: false
    end
    add_foreign_key :exercise_analogs, :exercises
    add_foreign_key :exercise_analogs, :analogs
  end
end
