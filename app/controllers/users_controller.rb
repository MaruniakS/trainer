class UsersController < ApplicationController
  before_action  :authenticate_user!
  before_action :check_user, only: [:show, :edit]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :phone_number, :email, :password, :password_confirmation, :avatar)
  end
end
