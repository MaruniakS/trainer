class ProgramsController < ApplicationController
  before_action :check_user, only: [:index]
  before_action :program_info, only: [:show, :common_program]
  def index
    @user = current_user
    @programs = @user.training_programs
  end

  def show
  end

  def edit
    @program = TrainingProgram.find(params[:id])
    @exercises = Exercise.all
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

  def all_programs
    @programs = TrainingProgram.includes(:program_type).all
    @body_types = TrainingProgram.body_types
    @male_types = User.male_types
  end

  def common_program
    render action: 'show'
  end

  private
  def program_info
    @program = TrainingProgram.find(params[:id])
    info = @program.days_count
    @days_count = info[0]
    @ex_count = info[1]
    @author = @program.get_author
  end
end
