class TrainingDaysController < ApplicationController
  before_action  :authenticate_user!
  def edit
    @tday = TrainingDay.find(params[:day])
    exercise = Exercise.find(params[:exercise])
    tday_exercise = TrainingDayExercise.new(training_day: @tday, exercise: exercise, sets: params[:sets], repetitions: params[:repetitions],
    rest: params[:rest])
    @exercises = Exercise.all
    @index = params[:index]
    if tday_exercise.save
      render template: 'programs/js_refresh/exercise_save'
    else
      @errors = tday_exercise.errors
      render template: 'programs/js_refresh/exercise_not_save'
    end
  end

  def change_exercise
    @exercise = TrainingDayExercise.find(params[:day_exercise])
    ex = Exercise.find(params[:exercise])
    @exercises = Exercise.all
    @exercise.rest = params[:rest]
    @exercise.sets = params[:sets]
    @exercise.repetitions = params[:repetitions]
    @exercise.exercise = ex
    @index = params[:index]
    if @exercise.save
      render template: 'programs/js_refresh/exercise_edited'
    else
      @errors = @exercise.errors
      render template: 'programs/js_refresh/exercise_not_edited'
    end
  end

  def delete_exercise
    exercise = TrainingDayExercise.find(params[:id])
    @index = params[:index]
    @tday = exercise.training_day
    @exercises = Exercise.all
    exercise.destroy
    render template: 'programs/js_refresh/exercise_deleted'
  end
end
