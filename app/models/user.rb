class User < ActiveRecord::Base

	validates :email, :first_name, :last_name, :presence =>true
	validates_uniqueness_of :email

end
