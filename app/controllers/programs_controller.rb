class ProgramsController < ApplicationController
  def index
    @programs = TrainingProgram.all
  end

  def show
    @program = TrainingProgram.find(params[:id])
  end
end
