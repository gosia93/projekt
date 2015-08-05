# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r1 = Role.create({name: "Wolontariusz"})
r2 = Role.create({name: "Organjzacja"})
r3 = Role.create({name: "Osoba prywatna"})


admin = User.create({login: "admin", role_id: "4" , email:"strefa_wolontariatu@poczta.fm", password:"strefa123"})
