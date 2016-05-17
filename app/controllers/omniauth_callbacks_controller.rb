class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    generic_callback( 'facebook' )
  end

  def generic_callback( provider )
    @identity = Identity.find_for_oauth env['omniauth.auth']

    @user = User.find_by(email: @identity.email)

    @user = @identity.user || current_user if @user.nil?
    if @user.nil?
      @user = User.new(email: @identity.email || '')
      i = 0
      size = User.all.count
      while true
        name = "unnamed_user#{size+i}"
        if User.where(username: name).empty?
          @user.username = name
          break
        else
          i+=1
        end
      end
      @user.skip_confirmation!
      @user.save
      @identity.update_attribute( :user_id, @user.id )
    end

    if @user.email.blank? && @identity.email
      @user.update_attribute( :email, @identity.email)
    end

    if @user.persisted?
      @identity.update_attribute( :user_id, @user.id )
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end