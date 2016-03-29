# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "jhoynerk@gmail.com", password: "password", first_name: "jhoynerk", last_name: "caraballo", work: 'desarrollador')
p User.last.first_name
User.create!(email: "prizni20@gmail.com", password: "password", first_name: "prizni", last_name: "marquez", work: 'analista', admin: true)
p User.last.first_name
Customer.create!(business_name: "Sistemas Boolean", rif: 'J-40015481-4', address: "Urb Castillejo Guatire", phone: '0416-15458481', email: 'sboolean@gmail.com', status: true)
Customer.create!(business_name: "Jardin de Botas", rif: 'J-08015481-4', address: "Av. Sucre, Catia", phone: '0416-165648', email: 'jbotas@gmail.com', status: false)
Product.create(name: 'Administrativo', description: 'Sistema para administración de empresas', version: '2K6', status: true)
Product.create(name: 'Nomina', description: 'Sistema para nómina de empresas', version: '2K6', status: false)
Product.create(name: 'Contabilidad', description: 'Sistema de contabilidad para empresas', version: '2K6', status: false)
Product.create(name: 'Punto de Venta', description: 'Sistema de puntos de ventas', version: '2K6', status: true)
Product.create(name: 'Inteligencia de Negocios', description: 'Sistema para mejorar tu negocio', version: '2K6', status: true)
Product.create(name: 'Avisos y Tareas', description: 'Sistema de notificaciones y aviso importante', version: '2K6', status: true)
Product.create(name: 'Producción', description: 'Sistema para mejorar la producción en tu negocio', version: '2K6', status: false)
Product.create(name: 'Administrativo', description: 'Sistema para administración de empresas', version: '2K8', status: true)
Product.create(name: 'Nomina', description: 'Sistema para nómina de empresas', version: '2K8', status: true)
Product.create(name: 'Contabilidad', description: 'Sistema de contabilidad para empresas', version: '2K8', status: false)
Product.create(name: 'Punto de Venta', description: 'Sistema de puntos de ventas', version: '2K8', status: true)
Product.create(name: 'Inteligencia de Negocios', description: 'Sistema para mejorar tu negocio', version: '2K8', status: true)
Product.create(name: 'Avisos y Tareas', description: 'Sistema de notificaciones y aviso importante', version: '2K8', status: false)
Product.create(name: 'Producción', description: 'Sistema para mejorar la producción en tu negocio', version: '2K8', status: true)
Product.create(name: 'Administrativo', description: 'Sistema para administración de empresas', version: '2K12', status: true)
Product.create(name: 'Nomina', description: 'Sistema para nómina de empresas', version: '2K12', status: true)
Product.create(name: 'Contabilidad', description: 'Sistema de contabilidad para empresas', version: '2K12', status: false)
Product.create(name: 'Punto de Venta', description: 'Sistema de puntos de ventas', version: '2K12', status: true)
Product.create(name: 'Inteligencia de Negocios', description: 'Sistema para mejorar tu negocio', version: '2K12', status: true)
Product.create(name: 'Avisos y Tareas', description: 'Sistema de notificaciones y aviso importante', version: '2K12', status: true)
Product.create(name: 'Producción', description: 'Sistema para mejorar la producción en tu negocio', version: '2K12', status: false)
Product.create(name: 'Profit Movil', description: '', version: '2K6', status: true)
p 'Fin Semillas'
