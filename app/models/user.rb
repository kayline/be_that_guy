class User < ActiveRecord::Base
	has_many :challenges_users
	has_many :challenges, :through => :challenges_users

	has_secure_password
	validates_presence_of :password, :on => :create

	def available_challenges
		# eventually dependent on user point level
		Challenge.where("level <= ?", self.points/10)
	end

end
