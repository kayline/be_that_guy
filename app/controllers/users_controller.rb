class UsersController < ApplicationController

def create
	p params
	@user = User.new(user_params)
	if @user.save
		session[:user_id] = @user.id
		redirect_to @user
	else
		redirect_to root_path, flash[:notice] = @user.errors.full_messages
	end
end

def show
	@user = User.find(params[:id])
end

private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end