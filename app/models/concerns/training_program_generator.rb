module TrainingProgramGenerator
  extend ActiveSupport::Concern

  module ClassMethods
    def generate_program(params, user)
      begin
        program = TrainingProgram.create(name: 'Індивідуальна програма тренувань', male_type: params[:male_type], body_type: params[:body_type], program_type_id: params[:program_type_id], user: user)
        days = male_ectomorph_weight
        program.first_day = days[0]
        program.second_day = days[1]
        program.third_day = days[2]
        program.fourth_day = days[3]
        program.fifth_day = days[4]
        program.sixth_day = days[5]
        program.seventh_day = days[6]
        program.save
        program
      end
    end

    private
    def male_ectomorph_weight
      days = Array.new(7) {TrainingDay.create}
      puts '*'*100
      puts days
      #day 1
      group1 = Exercise.where(muscle_group_id: 6)
      ex1 = group1.first
      ex2 = group1.second
      ex3 = group1.third
      ex4 = group1[5]
      group2 = Exercise.where(muscle_group_id: 7)
      ex5 = group2.first
      ex6 = group2.second

      TrainingDayExercise.create(training_day: days[0], exercise: ex1, rest: 2, sets: 5, repetitions: 8)
      TrainingDayExercise.create(training_day: days[0], exercise: ex2, rest: 2, sets: 3, repetitions: 12)
      TrainingDayExercise.create(training_day: days[0], exercise: ex3, rest: 2, sets: 3, repetitions: 12)
      TrainingDayExercise.create(training_day: days[0], exercise: ex4, rest: 1, sets: 4, repetitions: 15)
      TrainingDayExercise.create(training_day: days[0], exercise: ex5, rest: 2, sets: 1, repetitions: 50)
      TrainingDayExercise.create(training_day: days[0], exercise: ex6, rest: 2, sets: 3, repetitions: 15)

      #day2
      group1 = Exercise.where(muscle_group_id: 2)
      ex1 = group1.first
      ex2 = group1[4]
      ex3 = group1[6]
      ex4 = group1[3]
      group2 = Exercise.where(muscle_group_id: 4)
      ex5 = group2.second

      TrainingDayExercise.create(training_day: days[2], exercise: ex1, rest: 2, sets: 4, repetitions: 10)
      TrainingDayExercise.create(training_day: days[2], exercise: ex2, rest: 2, sets: 3, repetitions: 8)
      TrainingDayExercise.create(training_day: days[2], exercise: ex3, rest: 2, sets: 3, repetitions: 10)
      TrainingDayExercise.create(training_day: days[2], exercise: ex4, rest: 2, sets: 3, repetitions: 15)
      TrainingDayExercise.create(training_day: days[2], exercise: ex5, rest: 2, sets: 3, repetitions: 15)

      #day3
      group1 = Exercise.where(muscle_group_id: 1)
      ex1 = group1.first
      ex2 = group1.second
      ex3 = group1[4]
      group2 = Exercise.where(muscle_group_id: 3)
      ex4 = group2[2]
      ex5 = group2[5]

      TrainingDayExercise.create(training_day: days[4], exercise: ex1, rest: 3, sets: 5, repetitions: 8)
      TrainingDayExercise.create(training_day: days[4], exercise: ex2, rest: 2, sets: 3, repetitions: 12)
      TrainingDayExercise.create(training_day: days[4], exercise: ex3, rest: 2, sets: 3, repetitions: 15)
      TrainingDayExercise.create(training_day: days[4], exercise: ex4, rest: 2, sets: 3, repetitions: 10)
      TrainingDayExercise.create(training_day: days[4], exercise: ex5, rest: 1, sets: 3, repetitions: 15)
      days
    end
  end
end