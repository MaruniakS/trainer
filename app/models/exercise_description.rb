class ExerciseDescription < ActiveRecord::Base
  belongs_to :exercise
  validates :title, presence: true, numericality: true
end
