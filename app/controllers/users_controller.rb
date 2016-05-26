class UsersController < ApplicationController
  calendarize
  before_action :check_user, only: [:show, :edit]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
end
