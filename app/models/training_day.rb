class TrainingDay < ActiveRecord::Base
  has_many :training_day_exercises, dependent: :destroy
  has_many :exercises, through: :training_day_exercises
  [:first_day, :second_day, :third_day, :fourth_day, :fifth_day, :sixth_day, :seventh_day].each do |day|
    has_many :training_programs, foreign_key: day
  end


  def has_exercises?
    exercises.count > 0 ? true : false
  end
end
