class User < ActiveRecord::Base
  self.table_name = 'users'
  has_many :lastposts
  has_many :adminmessages
  
  def typ
    super || 0
  end
  
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

  def superior?(typ2)
    typ > typ2 && !banned?
	end

	def self.guest
		new
	end
end
