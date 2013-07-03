class SessionsController < ApplicationController
	include AuthHelper

	def new
		@user = User.new
		render 'users/login'
	end

  def create
  	@user = User.find_by_username(params[:username])
  	check_login(@user, params[:password])
  end

  def destroy
  	session.clear
  	redirect_to root_path, flash[:notice] => "You have logged out"
  end

end