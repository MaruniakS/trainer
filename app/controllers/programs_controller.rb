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
    puts '*'*100
    puts params
    puts '*'*100
    @programs = TrainingProgram.filter(params.slice(:body_type, :program_type, :male_type))
    puts '*'*100
    puts @programs
  end
end
