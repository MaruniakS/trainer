class TrainingProgram < ActiveRecord::Base
  belongs_to :program_type
  belongs_to :user
  belongs_to :owner, class_name: 'User'
  [:first_day, :second_day, :third_day, :fourth_day, :fifth_day, :sixth_day, :seventh_day].each do |day|
    belongs_to day,  class_name: 'TrainingDay'
  end
=begin
  belongs_to :first_day, class_name: 'TrainingDay'
  belongs_to :second_day, class_name: 'TrainingDay'
  belongs_to :third_day, class_name: 'TrainingDay'
  belongs_to :fourth_day, class_name: 'TrainingDay'
  belongs_to :fifth_day, class_name: 'TrainingDay'
  belongs_to :sixth_day, class_name: 'TrainingDay'
  belongs_to :seventh_day, class_name: 'TrainingDay'
=end
end
