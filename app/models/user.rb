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
  
  def verificated?
    verificated
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
  
  def update_attributes
    Hash.new([:id, :name, :vorname, :email, :benutzername, :passwort].map do |key|
      [key, attributes[key]]
    end)
  end
end
