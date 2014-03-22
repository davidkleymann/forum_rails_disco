module Domain
  module PostValidations
    extend ActiveSupport::Concern
    include ActiveEvent::Validations

    validation_target :'CreatePostCommand'
    validation_target :'UpdatePostCommand'

    included do
      validates :title, {
          unique_title: true
      }
			skip_validate :antispam
    end

    class UniqueTitleValidator < ActiveModel::EachValidator

      def validate_each(record, attr_name, value)
        record.errors.add(attr_name, :taken) if Post.any_with_title(record.id, value)
      end
    end
  end
end
