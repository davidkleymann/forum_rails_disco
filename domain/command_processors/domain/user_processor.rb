module Domain
  class UserProcessor
    include ActiveDomain::CommandProcessor

    process RegisterUserCommand do |command|
      command.id = ActiveDomain::UniqueCommandIdRepository.new_for command.class.name
      command.is_valid_do { event RegisterUserEvent.new command.to_hash }
    end

    process LogInCommand do |command|
      command.is_valid_do { event LoggedInEvent.new command.to_hash }
    end
  end
end