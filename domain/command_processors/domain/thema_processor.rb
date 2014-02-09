module Domain
  class ThemaProcessor
    include ActiveDomain::CommandProcessor

    process DeleteThemaCommand do |command|
      command.is_valid_do { event DeletedThemaEvent.new command.to_hash }
    end

    process UpdateThemaCommand do |command|
      command.is_valid_do { event UpdatedThemaEvent.new command.to_hash }
    end

    process CreateThemaCommand do |command|
      command.is_valid_do { event CreatedThemaEvent.new command.to_hash }
    end
  end
end