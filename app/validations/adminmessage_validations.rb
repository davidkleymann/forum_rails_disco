module AdminmessageValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'CreateThemaCommand'
  validation_target :'UpdateThemaCommand'
  
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