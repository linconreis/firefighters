# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Firefighter.exists?
	Firefighter.create name: "lincon", last_name: "reis", phone: "54996583860", commandant: "true", type_blood: "o+", password: "12345", email: "lincon9891@gmail.com", registration: "101010", birth_date: "13/10/1989", renew_password: "false"
	Firefighter.create name: "comandante", last_name: "major", phone: "5499999999", commandant: "true", type_blood: "o+", password: "12345", email: "comandante@gmail.com", registration: "151515", birth_date: "10/01/1989", renew_password: "false"
end
