module Domain
  class AdminMessageProcessor
    include ActiveDomain::CommandProcessor

    process DeleteAdminMessageCommand do |command|
      command.is_valid_do { event DeletedAdminMessageEvent.new command.to_hash }
    end

    process UpdateAdminMessageCommand do |command|
      command.is_valid_do { event UpdatedAdminMessageEvent.new command.to_hash }
    end

    process CreateAdminMessageCommand do |command|
      command.is_valid_do { event CreatedAdminMessageEvent.new command.to_hash }
    end
  end
end
