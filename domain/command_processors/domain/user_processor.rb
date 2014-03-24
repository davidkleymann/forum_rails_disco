module Domain
  class UserProcessor
    include ActiveDomain::CommandProcessor

    process RegisterUserCommand do |command|
      command.id = ActiveDomain::UniqueCommandIdRepository.new_for command.class.name
      id = command.is_valid_do { event RegisterUserEvent.new command.to_hash }
    end

    process LogInCommand do |command|
      id = command.is_valid_do { event LogInEvent.new command.to_hash }
    end

    process UpdateUserCommand do |command|
      id = command.is_valid_do {event UpdatedUserEvent.new command.to_hash}
    end

    process DeleteUserCommand do |command|
      id = command.is_valid_do { event DeletedUserEvent.new command.to_hash}
    end

    process BanUserCommand do |command|
      id = command.is_valid_do { event BannedUserEvent.new command.to_hash}
    end
      
    process UnbanUserCommand do |command|
      id = command.is_valid_do { event UnbannedUserEvent.new command.to_hash }
    end

    process ChangeRoleCommand do |command|
      id = command.is_valid_do {event ChangedRoleEvent.new command.to_hash}
    end
    
  end
end