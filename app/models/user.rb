class User < ActiveRecord::Base
	has_many :challenges_users
	has_many :challenges, :through => :challenges_users

end
