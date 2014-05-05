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

  def superior?
    typ > 1 && !banned?
	end

	def self.guest
		new
	end
  
  def updatable_attributes
    attributes.slice(*%w(id name vorname email benutzername passwort))
  end
end
