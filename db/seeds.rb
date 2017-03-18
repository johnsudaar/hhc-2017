# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Badge.create(title: "Premier Don", icon: "premier-don", annual_threshold: 0, global_threshold: 1)
Badge.create(title: "Semi maradon", icon: "semi-maradon", annual_threshold: 2, global_threshold: 0)
Badge.create(title: "Donkishoot", icon: "donkishoot", annual_threshold: 4, global_threshold: 0)
Badge.create(title: "Maradon", icon: "maradon", annual_threshold: 0, global_threshold: 24)

blood_type = [
	"AB+","AB-","A+","A-","B+","B-","O+","O-"
]

blood_type.each do | rhesus |
	BloodType.create(rhesus:rhesus)
end

entities = [
 ["Hopital de Hautepierre", "France", "Strasbourg", "1 Avenue Molière, France", "67200", true, 48.5947258, 7.708726599999977],
 ["EFS", "France", "Strasbourg", "10 Rue Spielmann", "67000", true, 48.57586879999999, 7.751326899999981],
 ["Centre Culturel Marcel Marceau", "France", "Strasbourg", "5 place Albert Schweitzer ", "67100", false, 48.5644471, 7.770255099999986],
 ["Lycée Privé Yunus Emre Salle des Conférences", "France", "Strasbourg", "14 rue Thomas Mann ", "67200", false, 48.8299664, 2.379982299999938]
]

entities.each do | name, country, city, street, post_code, permanent, latitude, longitude |
	entity = Entity.create(name:name, country:country, city:city, street:street, post_code:post_code, permanent:permanent, longitude:longitude, latitude:latitude)
	i=1
	tot=8
	while i <= tot do
		if entity.permanent then
			entity.needs << Need.create(percent: 1+Random.rand(60), blood_type_id:i);
			i+=1
		else
			i+=1
		end

	end
end
