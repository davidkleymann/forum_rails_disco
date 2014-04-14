module UserVerificatedValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations
  

  validation_target :'VerificatedUserCommand'
  
  included do

    #validates :verificated
  end  
  def verificated
    errors.add(:base, 'Validcfcj') if params[:userunlock]==URI.encode(User.find(user_id).shash)
  end
        
end 