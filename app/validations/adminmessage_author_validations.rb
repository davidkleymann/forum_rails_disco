module AdminmessageAuthorValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'CreateAdminmessageCommand'
  
  included do
    validate :author
  end
  
  def author
    adminmessage = Adminmessage.find(id)
    errors.add(:base, 'Falscher Nutzer') unless adminmessage.user_id == editor_id
  end
end