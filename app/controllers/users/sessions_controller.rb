class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    #super
    sign_in(current_user)
    current_user.generate_temporary_authentication_token
    redirect_to root_path
  end

  # DELETE /resource/sign_out
  def destroy
    #super
    current_user.clear_temporary_authentication_token
    sign_out(current_user)
    redirect_to root_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
