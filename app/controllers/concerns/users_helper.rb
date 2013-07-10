module UsersHelper

	def current_user
		@current_user || User.find(sessions[:user_id])
	end

end