module PostAuthorValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'UpdatePostCommand'
  
  included do
    validate :author
  end
  
  def author
    post = Post.find(id)
    errors.add(:base, 'Falscher Nutzer') unless post.user_id == user_id || User.find(user_id).typ == 1
  end
end