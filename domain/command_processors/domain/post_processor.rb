module Domain
  class PostProcessor
    include ActiveDomain::CommandProcessor

    process DeletePostCommand do |command|
      command.is_valid_do { event DeletedPostEvent.new command.to_hash }
    end

    process UpdatePostCommand do |command|
      command.is_valid_do { event UpdatedPostEvent.new command.to_hash }
    end

    process CreatePostCommand do |command|
      command.id = ActiveDomain::UniqueCommandIdRepository.new_for command.class.name
        command.is_valid_do { event CreatedPostEvent.new command.to_hash }
    end
  end
end