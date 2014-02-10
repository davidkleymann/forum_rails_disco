module Domain
  module RegisterUserValidations
    extend ActiveSupport::Concern
    include ActiveEvent::Validations

    validation_target :'RegisterUserCommand'

    included do
      validates :benutzername, {
        unique_name: true
      }
    end

    class UniqueNameValidator < ActiveModel::EachValidator

      def validate_each(record, attr_name, value)
        record.errors.add(attr_name, :taken) if User.any_with_name(record.id, value)
      end
    end
  end
end