# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


v1 = VolontaryType.create({name:"praca z dziećmi"})
v2 = VolontaryType.create({name:"praca z osobami starszymi"})
v3 = VolontaryType.create({name:"praca z osobami niepełnosprawnymi"})
v4 = VolontaryType.create({name:"praca w hospicjum"})
v5 = VolontaryType.create({name:"praca w ośrodkach specjalnych"})
v6 = VolontaryType.create({name:"praca z osobami uzależnionymi"})
v7 = VolontaryType.create({name:"projekty kulturalne"})
v8 = VolontaryType.create({name:"prjekty edukacyjne"})
v9 = VolontaryType.create({name:"projekty ekologiczne" })
v10 = VolontaryType.create({name:"pomoc zwierzętom"})
v11 = VolontaryType.create({name:"projekty sportowe"})
v12 = VolontaryType.create({name:"inne"})



admin = User.create({login: "admin", role_id: "4" , email:"strefa_wolontariatu@poczta.fm", password:"strefa123"})
