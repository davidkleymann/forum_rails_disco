module PostAuthorValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'PostUpdateCommand'
  
  included do
    validate :author
  end
  
  def author
    post = Post.find(id)
    errors.add(:base, 'Falscher Nutzer') unless post.user_id == editor_id
  end
end