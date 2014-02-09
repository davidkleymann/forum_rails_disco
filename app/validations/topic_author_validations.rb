module TopicAuthorValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'UpdateTopicCommand'
  
  included do
    validate :author
  end
  
  def author
    topic = Topic.find(id)
    errors.add(:base, 'Falscher Nutzer') unless topic.user_id == editor_id
  end
end