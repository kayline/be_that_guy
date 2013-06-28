class ChallengesUser < ActiveRecord::Base
	belongs_to :user, :challenge
end
