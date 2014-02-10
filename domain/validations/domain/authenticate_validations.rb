module Domain
  module AuthenticateValidations
    extend ActiveSupport::Concern
    include ActiveEvent::Validations

    validation_target :'AuthenticateCommand'

    included do
      validate :authenticated
    end

    def authenticated
      unless Admin.where("user_id=?", id).exists?
        errors.add(:base, "Sie besitzen nicht die erforderlichen Rechte")
      end
    end
  end
end