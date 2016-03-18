# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "jhoynerk@gmail.com", password: "password", first_name: "jhoynerk", last_name: "caraballo", work: 'desarrollador')
User.create!(email: "prizni20@gmail.com", password: "password", first_name: "prizni", last_name: "marquez", work: 'desarrollador', admin: true)
Customer.create!(business_name: "Sistemas Boolean", rif: 'J-40015481-4', address: "Urb Castillejo Guatire", phone: '0416-15458481', email: 'sboolean@gmail.com', status: true)
Customer.create!(business_name: "Jardin de Botas", rif: 'J-08015481-4', address: "Av. Sucre, Catia", phone: '0416-165648', email: 'jbotas@gmail.com', status: false)
