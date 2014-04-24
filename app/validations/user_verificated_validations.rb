module UserVerificatedValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations
  

  validation_target :'VerificatedUserCommand'
  
  included do

    validate :verificated
  
  end  
  def verificated
    errors.add(:base, 'err') if params[:userunlock]==URI.encode(User.find(user_id).shash)
  end
        
end 