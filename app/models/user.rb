class User < ActiveRecord::Base
	has_many :challenges_users
	has_many :challenges, :through => :challenges_users

	has_secure_password
	validates_presence_of :password, :on => :create

	def available_challenges
		all_active = Challenge.where("level <= ?", self.points/10)
		avail = all_active.reject {|chal| self.challenges.include?(chal) }
	end

	def active_challenges
		records = self.challenges_users.select {|rec| rec.status != "complete"}
		chals = []
		records.each do |rec|
			chals.push(Challenge.find(rec.challenge_id))
		end
		return chals
	end

	def completed_challenges
		records = self.challenges_users.select {|rec| rec.status == "complete"}
		chals = []
		records.each do |rec|
			chals.push(Challenge.find(rec.challenge_id))
		end
		return chals
	end

end
