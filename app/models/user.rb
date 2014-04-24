class User < ActiveRecord::Base
  self.table_name = 'users'
  has_many :last_posts
  has_many :admin_messages
  has_many :subscriptions
  
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
  
  def updatable_attributes
    Hash[[:id, :name, :vorname, :email, :benutzername, :passwort].map do |key|
      [key, attributes[key.to_s]]
    end]
  end
end
