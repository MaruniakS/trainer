class CreateTrainingPrograms < ActiveRecord::Migration
  def change
    create_table :training_programs do |t|
      t.string :name
      t.references :program_type, index: true
      t.text :description
      t.integer :body_type
      t.integer :male_type
      t.references :first_day, index: true
      t.references :second_day, index: true
      t.references :third_day, index: true
      t.references :fourth_day, index: true
      t.references :fifth_day, index: true
      t.references :sixth_day, index: true
      t.references :seventh_day, index: true
      t.references :template, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :training_programs, :program_types
    add_foreign_key :training_programs, :first_days
    add_foreign_key :training_programs, :second_days
    add_foreign_key :training_programs, :third_days
    add_foreign_key :training_programs, :fourth_days
    add_foreign_key :training_programs, :fifth_days
    add_foreign_key :training_programs, :sixth_days
    add_foreign_key :training_programs, :seventh_days
    add_foreign_key :training_programs, :templates
    add_foreign_key :training_programs, :users
  end
end
