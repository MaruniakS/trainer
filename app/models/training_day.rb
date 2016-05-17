class TrainingDay < ActiveRecord::Base
  has_many :training_day_exercises, dependent: :destroy
  has_many :exercises, through: :training_day_exercises

  def has_exercises?
    exercises.count > 0 ? true : false
  end
end
