module ThemaValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'CreateThemaCommand'
  validation_target :'UpdateThemaCommand'
  
  included do
    validates :title, {
        presence: true,
        length: 3..80
    }

    validates :description, {
        presence: true
      
    }
   end
end