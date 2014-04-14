module Domain
  class SubscriptionProcessor
    include ActiveDomain::CommandProcessor
    process DeleteSubscriptionCommand do |command|
      command.is_valid_do do
        event DeletedSubscriptionEvent.new command.to_hash
      end
    end

    process UpdateSubscriptionCommand do |command|
      command.is_valid_do do
        event UpdatedSubscriptionEvent.new command.to_hash
      end
    end

    process CreateSubscriptionCommand do |command|
      command.is_valid_do do
        id = ActiveDomain::UniqueCommandIdRepository.new_for command.class.name
        event CreatedSubscriptionEvent.new command.to_hash.merge(id: id)
      end
    end

  end
end
