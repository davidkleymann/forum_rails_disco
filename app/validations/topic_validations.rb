module TopicValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'CreateTopicCommand'
  validation_target :'UpdateTopicCommand'
  
  included do
    validates :title, {
        presence: true,
        length: 3..80
    }

    validates :thema_id, {
        presence: true
      
    }
   end
end