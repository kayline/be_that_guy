class ChallengesController < ApplicationController

	def index
		@challenges = Challenge.all
	end

	def show
		@challenge = Challenges.find(params[:challenge_id])
	end

	def new
		@challenge = Challenge.new
	end

	def create
		@challenge = Challenge.new(params[:challenge])
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


end