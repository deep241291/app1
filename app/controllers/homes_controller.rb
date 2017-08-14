class HomesController < ApplicationController
	def index
	end

	def redirect_user
		return redirect_to "#{ENV[:host_name]}?token=#{current_user.access_token.access_token}"
	end
end