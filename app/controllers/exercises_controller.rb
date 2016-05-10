class ExercisesController < ApplicationController
  def index
    @muscle_groups = MuscleGroup.all
  end

  def show
  end

  def group
    @exercises = Exercise.includes(:exercise_descriptions).by_group(params[:id])
  end
end
