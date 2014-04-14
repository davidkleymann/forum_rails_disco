module UserValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'RegisterUserCommand'

  included do
  	validates :name, {
        presence: true
  	}
  	validates :vorname, {
        presence:true
  	}
  	validates :email, {
  		presence:true
  	}
  	validates :benutzername, {
  		presence: true
  	}

    validates :passwort, {
      presence: :true,
      length: 8..50
    }
  end

end