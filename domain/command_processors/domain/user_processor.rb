module Domain
  class UserProcessor
    include ActiveDomain::CommandProcessor

    process RegisterUserCommand do |command|
      command.id = ActiveDomain::UniqueCommandIdRepository.new_for command.class.name
      id = command.is_valid_do { event RegisterUserEvent.new command.to_hash }
      puts 'Command verarbeitet'
      id
    end

    process LogInCommand do |command|
      id = command.is_valid_do { event LogInEvent.new command.to_hash }
    end
  end
end