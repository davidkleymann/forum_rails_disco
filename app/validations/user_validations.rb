module UserValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'RegisterUserCommand'

  included do
  	validates :Name, {
        presence: true
  	}
  	validates :Vorname, {
        presence:true
  	}
  	validates :Email, {
  		presence:true
  	}
  	validates :Benutzername, {
  		presence: true
  	}
  	validates :Passwort, {
  		presence:true,
  		length: 8..50
  	}
  end
end