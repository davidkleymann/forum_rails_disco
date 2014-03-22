class User < ActiveRecord::Base
  self.table_name = 'users'
  has_many :lastposts
  has_many :adminmessages

	def banned?
	  ban
	end
  def authenticated?
    persisted?
  end
	def registered?
    authenticated? && !banned?
	end
	def admin?
    typ > 0 && !banned?
	end

	def self.guest
		new
	end
end
