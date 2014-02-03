module Domain
  class AdminmessageProcessor
    include ActiveDomain::CommandProcessor

    process DeleteAdminmessageCommand do |command|
      command.is_valid_do { event DeletedAdminmessageEvent.new command.to_hash }
    end

    process UpdateAdminmessageCommand do |command|
      command.is_valid_do { event UpdatedAdminmessageEvent.new command.to_hash }
    end

    process CreateAdminmessageCommand do |command|
      command.is_valid_do { event CreatedAdminmessageEvent.new command.to_hash }
    end
  end
end