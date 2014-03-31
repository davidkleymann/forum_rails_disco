module PostValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'CreatePostCommand'
  validation_target :'UpdatePostCommand'

  included do
    validates :title, presence: true, length: 3..100
    validates :text, presence: true
    validates :user_id, presence: true
    validate :antispam
  end
  
  def antispam
    limit = DiscoForum::Application.config.limits_for_posts_in_two_minutes
    if Post.from_user(user_id).posted_since(1.minute.ago).count > limit
      errors.add(:base, 'Bitte warte kurz, bis du einen weiteren Post schreibst.')
    end
  end
end