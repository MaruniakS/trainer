module TrainingProgramGenerator
  extend ActiveSupport::Concern

  module ClassMethods
    def generate_program(params, user)
      puts '-' * 100
      ActiveRecord::Base.transaction do
      if TrainingProgram::male_types[params[:male_type]] == 0
        case TrainingProgram::body_types[params[:body_type]]
          when 0
            program = TrainingProgram.find_by(body_type: 0)#.dup
          when 1
            program = TrainingProgram.find_by(body_type: 1)#.dup
          when 2
            program = TrainingProgram.find_by(body_type: 2)#.dup
        end
      else
        # TODO
      end
      case params[:program_type_id]
        when 1
          coef = 3/4
        when 2
          coef = 5/4
        else
          coef = 1
      end
      pains = params[:joint_paint]
      duplicate_days(program, coef, pains)
      age_info(TrainingProgram::user_ages[params[:age]])
      program.user = user
      program.save!
      raise ActiveRecord::Rollback
      end
    end


    private
    def duplicate_days(program, coef, pains)
        puts '-' * 100
        days = program.training_days
        puts days
        program.first_day = days[0].dup
        program.second_day = days[1].dup
        program.third_day = days[2].dup
        program.fourth_day = days[3].dup
        program.fifth_day = days[4].dup
        program.sixth_day = days[5].dup
        program.seventh_day = days[6].dup
        program.save!
        days = program.training_days
        days.each do |day|
          day_exercises = day.training_day_exercises
          day_exercises.each do |day_exercise|
            tmp = day_exercise.dup
            tmp.training_day = day
            tmp.repetitions = (tmp.repetitions * coef).to_i
            pain(tmp, pains)
            tmp.save!
            possibility(tmp, params[:workout_1], params[:workout_2], params[:workout_3])
          end
          puts day.exercises.count
        end
    end

    def weight_index(w, h)
      i = w/(h*h)
      if i < 19
        d = 'Маса вашого тіла нижче норми. Це може викликати бронхо-легеневі захворювання.
Головними порадами є збільшення розміру раціону харчування та виключення кардіо-вправ з плану тренування.
Самі тренування повинні бути слабоінтенсивними та не займати довше 45хвилин.'
      elsif i < 25
        d = 'Маса вашого тіла у нормі, тому план тренувань потрібно складати на основі вашої тілобудови.'
      elsif i < 30
        d = 'Маса вашого тіла трохи вище норми, проте варто запланувати свої тренування з метою зменшення маси.
Для цього можна включати у програму вправи на кардіо-тренажерах.'
      elsif i < 35
        d = 'Маса вашого тіла вище норм (І стадія ожиріння). Ця проблема може перерости у серцево-судинні захворювання.
Інтенсивність тренувань варто збільшити, звернувши увагу на кардіо-вправи.'
      else
        d = 'Маса вашого тіла значно перевищує норму (ІІ - ІІІ стадія ожиріння). Ця проблема може виликати серцево-судинні, бронхово-легеневі та ендокринні проблеми.
При виборі програми радимо вам звернутися до професійного тренера.'
      end
      d
    end

    def age_info(age)
      if age == 0
        d = 'У ранньому віці не рекомендується виконувати такі вправи, що можуть пригальмувати розвиток вашого скелету через сильні навантаження на хребет. До таких вправ відносяться станова тяга, присідання зі штангою.
Рекомендуємо поконсультуватися з тренером та змінити програму в залежності від його порад.'
      elsif age == 1
        d = 'У вашому віці все ще є загроза припинення зростання через великі навантаження на опорно-рухову систему. Для новачків найкращим варіантом буде виконання вправ, що можуть травмувати хребет (станова тяга), у полегшеному режимі.'
      elsif age > 4
        d = 'У вашому віці існує загроза травми суглобів та взагалі опорної системи. Залежно від рівня вашої пвідготовленості та здоров’я організму замінюйте небезпечні вправи на полегшені.'
      else
        d = nil
      end
      d
    end

    def pain(tmp, pains)
      if tmp.exercise_id == 1 || tmp.exercise_id == 2 # Станова, тяга
        if pains.include? 3
          tmp.exercise_id = 7
        end
      elsif tmp.exercise_id == 38 # Присідання
        if pains.include? 0
          tmp.exercise_id = 42
        end
      elsif tmp.exercise_id == 35 || tmp.exercise_id == 33
        if pains.include? 1
          tmp.exercise_id = 37
        end
      elsif tmp.exercise_id == 14
        if pains.include? 2
          tmp.exercise_id = 18
        end
      elsif tmp.exercise_id == 43
        if pains.include? 4
          tmp.exercise_id = 44
        end
      end
    end

    def possibility(tmp, first, second, third)
      if tmp.exercise_id == 27
        if third == 'true'
          tmp.destroy
        end
      elsif tmp.exercise_id == 14
        if second == 'true'
          tmp.exercise_id = 18
          tmp.save!
        end
      elsif tmp.exercise_id == 5 || tmp.exercise_id == 6
        if first == 'true'
          tmp.exercise_id = 7
        end
      end
    end
  end
end