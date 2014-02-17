# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Domain.run_command(RegisterUserCommand.new(name: "Muster", vorname: "Max", email: "jjj@web.de", benutzername: "Ruby", passwort: "12345678", typ: 1))
Domain.run_command(RegisterUserCommand.new(name: "Test", vorname: "Alfons", email: "a@b.c", benutzername: "quirk", passwort: "12345678", typ: 1))
Domain.run_command(CreateThemaCommand.new(title: "Hello", description: "", belong: nil))
Domain.run_command(CreateThemaCommand.new(title: "SRZ", description: "Alles zum SRZ", belong: nil))
Domain.run_command(CreateThemaCommand.new(title: "Kochen", description: "", belong: 2))