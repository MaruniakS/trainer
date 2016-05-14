class ExerciseAnalog < ActiveRecord::Base
  belongs_to :exercise, class_name: 'Exercise'
  belongs_to :analog, class_name: 'Exercise'
end
