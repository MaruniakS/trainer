class ExercisesController < ApplicationController
  def index
    @muscle_groups = MuscleGroup.all
  end

  def show
    @exercise = Exercise.includes(:exercise_descriptions, :muscle_group).find(params[:id])
  end

  def group
    @exercises = Exercise.includes(:exercise_descriptions).by_group(params[:id])
  end
end
