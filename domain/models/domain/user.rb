module Domain
  class User < ActiveRecord::Base
    self.table_name = 'users'
    has_secure_password(validations: false)
    def self.any_with_name(id, name)
      User.where(benutzername: name).where.not(id: id).any?
    end
  end
end