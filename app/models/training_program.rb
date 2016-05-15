class TrainingProgram < ActiveRecord::Base
  belongs_to :program_type
  belongs_to :user
  belongs_to :owner, class_name: 'User'
  [:first_day, :second_day, :third_day, :fourth_day, :fifth_day, :sixth_day, :seventh_day].each do |day|
    belongs_to day,  class_name: 'TrainingDay'
  end
  enum body_type: [:ectomorph, :mesomorph, :endomorph]

  def training_days
    ids = [first_day_id, second_day_id, third_day_id, fourth_day_id, fifth_day_id, sixth_day_id, seventh_day_id]
    TrainingDay.where(id: ids)
  end
end
