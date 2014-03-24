# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@@can_run = true
def domain_run(command)
  Domain.run_command(command) if @@can_run
rescue DRb::DRbConnError
  puts 'no domain server for seeds'
  @@can_run = false
end

domain_run(RegisterUserCommand.new(name: "Muster", vorname: "Max", email: "jjj@web.de", benutzername: "Ruby", passwort: "12345678", typ: 1, ban: false))
domain_run(RegisterUserCommand.new(name: "Test", vorname: "Alfons", email: "a@b.c", benutzername: "quirk", passwort: "12345678", typ: 1, ban: false))
domain_run(RegisterUserCommand.new(name: "UhaHa", vorname: "Ckaaaar", email: "a@b.c", benutzername: "usehr", passwort: "12345678", typ: 0, ban: false))
domain_run(RegisterUserCommand.new(name: "Super", vorname: "Admin", email: "admin@boss.chef", benutzername: "Admin", passwort: "strenggeheim", typ: 2, ban: false))

domain_run(CreateThemaCommand.new(title: "Hello", description: "", belong: nil))
domain_run(CreateThemaCommand.new(title: "SRZ", description: "Alles zum SRZ", belong: nil))
domain_run(CreateThemaCommand.new(title: "Kochen", description: "", belong: 2))

domain_run(CreateTopicCommand.new(title: "Basteln", user_id: 1, thema_id: 1))
domain_run(CreateTopicCommand.new(title: "Zocken", user_id: 1, thema_id: 2))

domain_run(CreatePostCommand.new(title: "Check me!", text: "Origami", created_at: Time.now, user_id: 1, topic_id: 1))
#
# With Rails Disco you can invoke domain commands
#
# Examples:
#
#   city_id = domain_run(CityCreateCommand.new(name: 'Chicago'))
#   domain_run(MayorCreateCommand(name: 'Emanuel', city_id: city_id)
@@can_run = true
def domain_run(command)
  Domain.run_command(command) if @@can_run
rescue DRb::DRbConnError
  puts 'no domain server for seeds'
  @@can_run = false
end
