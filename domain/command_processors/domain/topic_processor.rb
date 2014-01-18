module Domain
  class TopicProcessor
    include ActiveDomain::CommandProcessor

    process DeleteTopicCommand do |command|
      command.is_valid_do { event DeletedTopicEvent.new command.to_hash }
    end

    process UpdateTopicCommand do |command|
      command.is_valid_do { event UpdatedTopicEvent.new command.to_hash }
    end

    process CreateTopicCommand do |command|
      command.is_valid_do { event CreatedTopicEvent.new command.to_hash }
    end
  end
end