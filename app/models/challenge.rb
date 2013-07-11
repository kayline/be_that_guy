class Challenge < ActiveRecord::Base
	has_many :challenges_users
	has_many :users, :through => :challenges_users
	before_save :level_to_code


	LEVEL_CODES = {'easy' => 1, 'moderate' => 2, 'challenging' => 3, 'hard' => 4, 'very hard' => 5, 'heroic' => 6}

	def self.levels
		LEVEL_CODES.keys
	end

	private
		def level_to_code
			self.level = LEVEL_CODES[self.level_name]
		end
end
