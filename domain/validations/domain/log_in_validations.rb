module Domain
  module LogInValidations
    extend ActiveSupport::Concern
    include ActiveEvent::Validations

    validation_target :'LogInCommand'

    included do
      validate :login_correct
    end

    def login_correct
      user = User.find_by(benutzername: benutzername)
      errors.add(:base, 'Login nicht korrekt') unless user && user.authenticate(passwort)
    end
  end
end
