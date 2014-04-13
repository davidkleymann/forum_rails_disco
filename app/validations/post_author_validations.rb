module PostAuthorValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'UpdatePostCommand'
  
  included do
    validate :author
  end
  
  def author
    errors.add(:base, 'Falscher Nutzer') unless Post.find(id).user_id == user_id || User.find(user_id).typ > 0
  end
end