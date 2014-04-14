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

domain_run RegisterUserCommand.new(name: "Muster", vorname: "Max", email: "jjj@web.de", benutzername: "Ruby", passwort: "12345678", typ: 1)
domain_run RegisterUserCommand.new(name: "Test", vorname: "Alfons", email: "a@b.c", benutzername: "quirk", passwort: "12345678", typ: 1)
domain_run RegisterUserCommand.new(name: "UhaHa", vorname: "Ckaaaar", email: "a@b.c", benutzername: "usehr", passwort: "12345678", typ: 0)
domain_run RegisterUserCommand.new(name: "Super", vorname: "Admin", email: "admin@boss.chef", benutzername: "Admin", passwort: "strenggeheim", typ: 2)
boeser_bub_id = domain_run RegisterUserCommand.new(name: "Böser", vorname: "Nutzer" , email: "boese@mail.spam", benutzername: "boese", passwort: "gehtgarni", typ: 0)
domain_run BanUserCommand.new(user_id: boeser_bub_id, ban: true)

domain_run CreateThemaCommand.new(title: "Hello", description: "y", belong: nil)
domain_run CreateThemaCommand.new(title: "SRZ", description: "Alles zum SRZ", belong: nil)
domain_run CreateThemaCommand.new(title: "Kochen", description: "y", belong: 2)

domain_run CreateTopicCommand.new(title: "Basteln", user_id: 1, thema_id: 1)
domain_run CreateTopicCommand.new(title: "Zocken", user_id: 1, thema_id: 2)

domain_run CreatePostCommand.new(title: "Check me!", text: "Origami", created_at: Time.now, user_id: 1, topic_id: 1)
