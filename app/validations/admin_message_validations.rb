module AdminMessageValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'CreateAdminMessageCommand'
  validation_target :'UpdateAdminMessageCommand'

  included do
    validates :message, {
        presence: true,
        length: 3..200
    }

    validates :user_id, {
        presence: true
    }
  end
end
