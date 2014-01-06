module PostValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'PostCreateCommand'
  validation_target :'PostUpdateCommand'

  included do
    validates :title, {
        presence: true,
        length: 3..100,
    }
    validates :text, {
        presence: true
    }
    validates :user, {
        presence: true,
        length: 1..50,
    }
  end
end