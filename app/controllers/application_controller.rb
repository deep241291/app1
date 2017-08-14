class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  after_action :check_access_token

  private 
  def check_access_token
	  if current_user && current_user.access_token.nil? 
			sign_out(current_user)
			return redirect_to root_path
		end
  end		 

end
