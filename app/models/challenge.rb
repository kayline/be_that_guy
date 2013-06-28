class Challenge < ActiveRecord::Base
	has_many :challenges_users
	has_many :users, :through => :challenges_users
end
