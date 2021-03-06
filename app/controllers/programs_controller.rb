class ProgramsController < ApplicationController
  before_action :check_user, only: [:index]
  before_action :program_info, only: [:show, :common_program]
  before_action  :authenticate_user!, except: [:all_programs, :common_program, :assign_to_user, :filter]
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

  def update
    @program = TrainingProgram.find(params[:id])
    if @program.update(program_params)
      redirect_to [current_user, @program]
    else
      render 'edit'
    end
  end

  def individual
    @program = TrainingProgram.new
  end

  def create_individual
    #render text: individual_params[:joint_pain]
    #@program = TrainingProgram.generate_program(individual_params, current_user)
    @program = TrainingProgram.generate_program(individual_params, current_user)
    #render json: @program.training_days[0].training_day_exercises
    redirect_to user_training_program_path(current_user, @program)
  end

  def filter
    @programs = TrainingProgram.filter(params.slice(:body_type, :program_type, :male_type))
    respond_to do |format|
      format.js
    end
  end

  def assign_to_user
    @program = TrainingProgram.find(params[:program])
    unless current_user.has_program? @program
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

  def program_params
    params.require(:training_program).permit(:name, :description, :program_type_id, :body_type, :male_type, :program_image)
  end

  def individual_params
    params.permit(:height, :weight, :program_type_id, :body_type, :male_type, :age, :workout_1, :workout_2, :workout_3, :user_id, joint_pain: [])
  end
end
