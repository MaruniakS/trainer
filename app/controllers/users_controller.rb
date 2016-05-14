class UsersController < ApplicationController

  before_action only: :personal do
    check_user(params[:id])
  end


  def personal

=begin
    @user = User.friendly.find(params[:id])
    if @user != current_user
      render text: 'haha'
    else
      render text: 'nice'
    end
=end
  end

  private
  def check_user(id)
    redirect_to root_path, flash: {error: 'You can login only to your profile!'} if ((id != current_user.id) && (id != current_user.username))
  end
end
