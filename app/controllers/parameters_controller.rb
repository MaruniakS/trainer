class ParametersController < ApplicationController
  include ChartData
  def index
    @parameters = user_parameters
    @data = ParametersController.generate_data(@parameters)
  end

  def create
    @parameter = current_user.parameters.create(parameter_params)
    @parameter.date = Date.today
    @parameter.save
    @parameters = user_parameters
    @data = ParametersController.generate_data(@parameters)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @parameter = Parameter.find_by(id: params[:id], user_id: params[:user_id])
    @parameter.destroy unless @parameter.nil?
    @parameters = user_parameters
    @data = ParametersController.generate_data(@parameters)
    respond_to do |format|
      format.js
    end
  end

  private
  def parameter_params
    params.require(:parameter).permit(:height, :weight, :neck, :shoulders, :chest, :biceps, :forearm, :waist, :hip, :thigh, :calf)
  end

  def user_parameters
    current_user.parameters
  end
end
