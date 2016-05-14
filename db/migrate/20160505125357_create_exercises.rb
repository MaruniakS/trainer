class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.string :youtube_url
      t.references :muscle_group, index: true

      t.timestamps null: false
    end
    add_foreign_key :exercises, :muscle_groups
  end
end
