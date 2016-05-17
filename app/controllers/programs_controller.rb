class ProgramsController < ApplicationController
  def index
    @programs = TrainingProgram.all
    @body_types = TrainingProgram.body_types
    @male_types = User.male_types
  end

  def show
    @program = TrainingProgram.find(params[:id])
  end

  def filter
    @programs = TrainingProgram.filter(params.slice(:body_type, :program_type, :male_type))
    respond_to do |format|
      format.js
    end
  end

  def assign_to_user
    @program = TrainingProgram.find(params[:program])
    if !current_user.has_program? @program
      @program.duplicate_program(current_user)
    end
    respond_to do |format|
      format.js
    end
  end
end
