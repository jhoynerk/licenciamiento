# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
p "Usuarios"
u1 = User.create!(email: "jhoynerk@gmail.com", password: "password", first_name: "jhoynerk", last_name: "caraballo", work: 'desarrollador', status: true)
p User.last.first_name
u2 = User.create!(email: "admin@gmail.com", password: "password", first_name: "administrador", last_name: "sistema", work: 'administrador', admin: true, status: true)
p User.last.first_name
u3 = User.create!(email: "usuario1@gmail.com", password: "password", first_name: "jhoynerk", last_name: "caraballo", work: 'desarrollador', status: true)
u4 = User.create!(email: "usuario2@gmail.com", password: "password", first_name: "jhoynerk", last_name: "caraballo", work: 'desarrollador', status: true)
u5 = User.create!(email: "usuario3@gmail.com", password: "password", first_name: "jhoynerk", last_name: "caraballo", work: 'desarrollador', status: true)
p 'Customer'
c1 = Customer.create!(business_name: "Sistemas Boolean", rif: 'J-40015481', address: "Urb Castillejo Guatire", phone: '0416-5458481', email: 'sboolean@gmail.com', status: true)
c2 = Customer.create!(business_name: "Jardin de Botas", rif: 'J-08015481', address: "Av. Sucre, Catia", phone: '0416-1656480', email: 'jbotas@gmail.com', status: false)
c3 = Customer.create!(business_name: "Grafitoca", rif: 'J-42325481', address: "Zona industrial de guarenas", phone: '0212-2312212', email: 'grafitoca@gmail.com', status: true)
c4 = Customer.create!(business_name: "Banesco", rif: 'J-00015481', address: "La castellana, caracas Venezuela", phone: '0212-5162000', email: 'contacto@banesco.com', status: true)
c5 = Customer.create!(business_name: "Mercantil", rif: 'J-00055481', address: "C.C. Lido Chacao", phone: '0800-5450000', email: 'contacto@mercantil.com', status: true)
c6 = Customer.create!(business_name: "4Geeks", rif: 'J-39815481', address: "Torre F Sabana Grande Caracas", phone: '0212-5239080', email: '4geeks@gmail.com', status: true)
p 'Products'
p1 = Product.create(name: 'Administrativo', description: 'Sistema para administración de empresas', version: '2K6', status: true)
p2 = Product.create(name: 'Nomina', description: 'Sistema para nómina de empresas', version: '2K6', status: false)
p3 = Product.create(name: 'Contabilidad', description: 'Sistema de contabilidad para empresas', version: '2K6', status: false)
p4 = Product.create(name: 'Punto de Venta', description: 'Sistema de puntos de ventas', version: '2K6', status: true)
p5 = Product.create(name: 'Inteligencia de Negocios', description: 'Sistema para mejorar tu negocio', version: '2K6', status: true)
p6 = Product.create(name: 'Avisos y Tareas', description: 'Sistema de notificaciones y aviso importante', version: '2K6', status: true)
p7 = Product.create(name: 'Producción', description: 'Sistema para mejorar la producción en tu negocio', version: '2K6', status: false)
p8 = Product.create(name: 'Administrativo', description: 'Sistema para administración de empresas', version: '2K8', status: true)
p9 = Product.create(name: 'Nomina', description: 'Sistema para nómina de empresas', version: '2K8', status: true)
p10 = Product.create(name: 'Contabilidad', description: 'Sistema de contabilidad para empresas', version: '2K8', status: false)
p11 = Product.create(name: 'Punto de Venta', description: 'Sistema de puntos de ventas', version: '2K8', status: true)
p12 = Product.create(name: 'Inteligencia de Negocios', description: 'Sistema para mejorar tu negocio', version: '2K8', status: true)
p13 = Product.create(name: 'Avisos y Tareas', description: 'Sistema de notificaciones y aviso importante', version: '2K8', status: false)
p14 = Product.create(name: 'Producción', description: 'Sistema para mejorar la producción en tu negocio', version: '2K8', status: true)
p15 = Product.create(name: 'Administrativo', description: 'Sistema para administración de empresas', version: '2K12', status: true)
p16 = Product.create(name: 'Nomina', description: 'Sistema para nómina de empresas', version: '2K12', status: true)
p17 = Product.create(name: 'Contabilidad', description: 'Sistema de contabilidad para empresas', version: '2K12', status: false)
p18 = Product.create(name: 'Punto de Venta', description: 'Sistema de puntos de ventas', version: '2K12', status: true)
p19 = Product.create(name: 'Inteligencia de Negocios', description: 'Sistema para mejorar tu negocio', version: '2K12', status: true)
p20 = Product.create(name: 'Avisos y Tareas', description: 'Sistema de notificaciones y aviso importante', version: '2K12', status: true)
p21 = Product.create(name: 'Producción', description: 'Sistema para mejorar la producción en tu negocio', version: '2K12', status: false)
p22 = Product.create(name: 'Profit Movil', description: 'Sistema de conexión movil', version: '2K6', status: true)
p 'Type License'
tl1 = TypeLicense.create(name: 'Premium Clásica', duration: '6', version: 'Premium', status: true)
tl2 = TypeLicense.create(name: 'Premium Plata', duration: '12', version: 'Premium', status: true)
tl3 = TypeLicense.create(name: 'Premium Oro', duration: '18', version: 'Premium', status: true)
tl4 = TypeLicense.create(name: 'Premium Black', duration: '24', version: 'Premium', status: true)
tl5 = TypeLicense.create(name: 'Standard Clásica', duration: '6', version: 'Standard', status: true)
tl6 = TypeLicense.create(name: 'Standard Plata', duration: '12', version: 'Standard', status: true)
tl7 = TypeLicense.create(name: 'Standard Oro', duration: '18', version: 'Standard', status: true)
tl8 = TypeLicense.create(name: 'Standard Black', duration: '24', version: 'Standard', status: true)
p 'Licencias Vencidas'

l = License.create(type_license: tl1, serial: Hashids.new(SecureRandom.hex(10), 20).encode_hex('ABC'), creation_date: Date.today - 1.year, user: u1, salt: SecureRandom.hex(10), number_computers: 3)
l.create_suit(customer: c1, product: p17)
l.create_contract(contract: '123123', status: 1)

l = License.create(type_license: tl3, serial: Hashids.new(SecureRandom.hex(10), 20).encode_hex('ABC'), creation_date: Date.today - 2.year, user: u1, salt: SecureRandom.hex(10), number_computers: 1)
l.create_suit(customer: c2, product: p13)
l.create_contract(contract: '212112', status: 1)

l = License.create(type_license: tl5, serial: Hashids.new(SecureRandom.hex(10), 20).encode_hex('ABC'), creation_date: Date.today - 8.month, user: u1, salt: SecureRandom.hex(10), number_computers: 2)
l.create_suit(customer: c3, product: p1)
l.create_contract(contract: '312321', status: 1)

l = License.create(type_license: tl7, serial: Hashids.new(SecureRandom.hex(10), 20).encode_hex('ABC'), creation_date: Date.today - 2.year, user: u1, salt: SecureRandom.hex(10), number_computers: 10)
l.create_suit(customer: c4, product: p13)
l.create_contract(contract: '002121', status: 1)

l = License.create(type_license: tl6, serial: Hashids.new(SecureRandom.hex(10), 20).encode_hex('ABC'), creation_date: Date.today - 1.year, user: u1, salt: SecureRandom.hex(10), number_computers: 1)
l.create_suit(customer: c5, product: p5)
l.create_contract(contract: '231012', status: 1)

l = License.create(type_license: tl2, serial: Hashids.new(SecureRandom.hex(10), 20).encode_hex('ABC'), creation_date: Date.today - 1.year, user: u1, salt: SecureRandom.hex(10), number_computers: 5)
l.create_suit(customer: c6, product: p7)
l.create_contract(contract: '0122312', status: 1)

l = License.create(type_license: tl4, serial: Hashids.new(SecureRandom.hex(10), 20).encode_hex('ABC'), creation_date: Date.today - 26.month, user: u1, salt: SecureRandom.hex(10), number_computers: 4)
l.create_suit(customer: c6, product: p22)
l.create_contract(contract: '0231313', status: 1)
p 'Fin Semillas'
