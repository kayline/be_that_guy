module AuthHelper
	extend ActiveSupport::Concern

	def check_login(user, password)
		if user && user.authenticate(password)
  		session[:user_id] = user.id
  		redirect_to user
  	else
  	end
	end

end