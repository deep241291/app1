class HomesController < ApplicationController
	def index
	end

	def redirect_user
		return redirect_to "#{ENV['HOST_NAME']}?token=#{current_user.access_token.access_token}"
	end
end