class TrainingDaysController < ApplicationController
  def show
  end

  def edit
    @tday = TrainingDay.find(params[:day])
    exercise = Exercise.find(params[:exercise])
    tday_exercise = TrainingDayExercise.new(training_day: @tday, exercise: exercise, sets: params[:sets], repetitions: params[:repetitions],
    rest: params[:rest])
    @exercises = Exercise.all
    if tday_exercise.save
      render template: 'programs/js_refresh/exercise_save'
    else
      @errors = tday_exercise.errors
      render template: 'programs/js_refresh/exercise_not_save'
    end
  end
end
