# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Badge.create(title: "First blood", icon: "", annual_threshold: 0, global_threshold: 1)
Badge.create(title: "Half Blood", icon: "", annual_threshold: 2, global_threshold: 0)
Badge.create(title: "Full Blood", icon: "", annual_threshold: 4, global_threshold: 0)
Badge.create(title: "Bloog god", icon: "", annual_threshold: 0, global_threshold: 24)

blood_type = [
	"A+", "A-", "AB+", "AB-", "B-", "B+", "O-", "O+"
]


blood_type.each do | rhesus |
	BloodType.create(rhesus:rhesus)
end

entities = [
 ["Hopital de Hautepierre", "France", "Strasbourg", " 10 rue Spielmann", "67065"],
 ["Lycée Privé Yunus", "France", "Strasbourg", "14 rue Thomas Mann", "67200"],
 ["Hopital de Hautepierre", "France", "Strasbourg", " 10 rue Spielmann", "67065"]
]

entities.each do | name, country, city, street, post_code |
	Entity.create(name:name, country:country, city:city, street:street, post_code:post_code)
end