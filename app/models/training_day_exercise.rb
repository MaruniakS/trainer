class TrainingDayExercise < ActiveRecord::Base
  belongs_to :training_day
  belongs_to :exercise

  validates :rest, :repetitions, :sets, presence: true, numericality: true
  validates :exercise_id, :training_day_id, presence: true
end
