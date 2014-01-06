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
<<<<<<< HEAD:disco-forum/app/validations/post_validations.rb

=======
    validates :user, {
        presence: true,
        length: 1..50,
    }
>>>>>>> a725a816baced78d8bc698f80739c5bfe8f0e51b:app/validations/post_validations.rb
  end
end