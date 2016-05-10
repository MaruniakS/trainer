class ExerciseDescription < ActiveRecord::Base
  belongs_to :exercise
  validates :step, presence: true
  validates :order, numericality: true
end
