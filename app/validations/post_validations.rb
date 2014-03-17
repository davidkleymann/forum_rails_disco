module PostValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'CreatePostCommand'
  validation_target :'UpdatePostCommand'

  included do
    validates :title, {
        presence: true,
        length: 3..100
    }
    validates :text, {
        presence: true
    }
    validates :user_id, {
        presence: true
    }
    validate :antispam
  end
  
  def antispam
    errors.add(:base, 'Bitte warte kurz, bis du einen weiteren Post schreibst.') if Post.all.where('created_at > ?', 1.minute.ago).where('user_id=?', user_id) .count > 5
  end
end