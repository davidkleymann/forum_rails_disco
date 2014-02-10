module Domain
  class AdminmessageProcessor
    include ActiveDomain::CommandProcessor

    process AuthenticateCommand do |command|
    	command.is_valid_do {puts "erfolgreich"}
    end
  end
end