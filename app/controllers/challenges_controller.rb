class ChallengesController < ApplicationController

	def index
		@challenges = Challenge.all
	end

	def show
		@challenge = Challenge.find(params[:id])
	end

	def new
		@challenge = Challenge.new
	end

	def create
		@challenge = Challenge.new(challenge_params)
		if @challenge.save
			redirect_to @challenge
		else
			@errors = @challenge.errors.full_messages
			render :new
		end
	end

	def edit
		@challenge = Challenges.find(params[:challenge_id])
	end

	def update
		@challenge = Challenges.find(params[:challenge_id])
	end

	def complete
		@user = User.find(session[:user_id])
		@challenge = Challenge.find(params[:id])
		@user_challenge = ChallengesUser.where("challenge_id = ? AND user_id = ?", @challenge.id, @user.id).first
		@user_challenge.update_attributes(status: "complete")
		@user.update_attributes(points: @user.points + @challenge.value)
		redirect_to @user
	end

	private
  def challenge_params
    params.require(:challenge).permit(:title, :description, :value, :level, :level_name)
  end


end