class TrainingDay < ActiveRecord::Base
  has_many :training_day_exercises, dependent: :destroy
  has_many :exercises, through: :training_day_exercises

  def training_programs(user)
    programs = TrainingProgram.where(user: user)
    programs.where('first_day_id= ? OR second_day_id= ? OR third_day_id= ? OR fourth_day_id= ? OR fifth_day_id= ? OR sixth_day_id= ? OR seventh_day_id= ?',
                   self.id, self.id, self.id, self.id, self.id, self.id, self.id,)
  end

  def has_exercises?
    exercises.count > 0 ? true : false
  end
end
