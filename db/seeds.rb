# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Badge.create(title: "First blood", icon: "", annual_threshold: 0, global_threshold: 1)
Badge.create(title: "Half Blood", icon: "", annual_threshold: 3, global_threshold: 0)
Badge.create(title: "Full Blood", icon: "", annual_threshold: 6, global_threshold: 0)
Badge.create(title: "Blood master", icon: "", annual_threshold: 0, global_threshold: 12)
Badge.create(title: "Bloog god", icon: "", annual_threshold: 0, global_threshold: 24)
