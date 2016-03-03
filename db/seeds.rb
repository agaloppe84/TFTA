puts "Destroying users"
User.destroy_all
puts "END"
puts "Destroying resa"
Reservation.destroy_all
puts "END"
puts "Destroying order line"
OrderLine.destroy_all
puts "END"
puts "Destroying menu"
Menu.destroy_all
puts "END"
puts "Destroying foodtruck"
Foodtruck.destroy_all
puts "END"
puts "Destroying dish"
Dish.destroy_all
puts "END"
puts "Destroying culinary style"
CulinaryStyle.destroy_all
puts "END"



puts "Seed started"
 # -------------------------------- Users consommateurs --------------------------------- #
puts "Seeding User"

michel = User.create!(first_name: 'michel',last_name: 'patoudatchi',address: "5 place de la bourse, bordeaux",age:'22' ,trucker: false, email:'michel@gmail.com', password: "1234soleil")
albert = User.create!(first_name: 'albert',last_name: 'roso',address: "10 rue amélie, paris",age:'25' ,trucker: false, email:'albert@gmail.com', password: "1234soleil")
robert = User.create!(first_name: 'robert',last_name: 'lamarche',address: "15 cours jean pénicaud, limoges",age:'26' ,trucker: false, email:'robert@gmail.com', password: "1234soleil")
jean = User.create!(first_name: 'jean',last_name: 'domingo',address: "20 cours jean pénicaud, limoges",age:'26' ,trucker: false, email:'jean@gmail.com', password: "1234soleil")
fred = User.create!(first_name: 'fred',last_name: 'florus',address: "25 cours jean pénicaud, limoges",age:'26' ,trucker: false, email:'fred@gmail.com', password: "1234soleil")
# -------------------------------- Users truckers --------------------------------- #

paul = User.create!(first_name: 'paul',last_name: 'riguas',address: "30 place de la bourse, bordeaux",age:'23' ,trucker: true, email:'paul@gmail.com', password: "1234soleil")
pierre = User.create!(first_name: 'pierre',last_name: 'zaio',address: "40 rue amélie, paris",age:'21' ,trucker: true, email:'pierre@gmail.com', password: "1234soleil")
agathe = User.create!(first_name: 'agathe',last_name: 'faio',address: "50 cours jean pénicaud, limoges",age:'30' ,trucker: true, email:'agathe@gmail.com', password: "1234soleil")
dorothée = User.create!(first_name: 'dorothée',last_name: 'maio',address: "60 cours jean pénicaud, limoges",age:'35' ,trucker: true, email:'dorothée@gmail.com', password: "1234soleil")
martin = User.create!(first_name: 'martin',last_name: 'tatin',address: "70 cours jean pénicaud, limoges",age:'33' ,trucker: true, email:'martin@gmail.com', password: "1234soleil")

puts "END"

# -------------------------------- Foodtruck --------------------------------- #
puts "Seeding Foodtruck"

bagin = Foodtruck.create!(sku:"", name:"Bag in", format:"truck", min_capacity:"40", max_capacity:"250", free_radius_max:"50", radius_max:"150", km_price_cents:"120", address:"bordeaux")
westcoast = Foodtruck.create!(sku:"", name:"West Coast", format:"truck", min_capacity:"60", max_capacity:"250", free_radius_max:"50", radius_max:"150", km_price_cents:"120", address:"limoges")
eltacodeldiablo = Foodtruck.create!(sku:"", name:"El tacos del Diablo", format:"truck", min_capacity:"80", max_capacity:"250", free_radius_max:"50", radius_max:"150", km_price_cents:"120", address:"paris")

puts "END"

# -------------------------------- Dish --------------------------------- #
puts "Seeding Dishes"

dishes1 = Dish.create!(foodtruck: bagin, name:"bagel au saumon", description:"un délicieux bagel au saumon" ,price_cents:"500", photo:"http://", category: "plat")
dishes2 = Dish.create!(foodtruck: westcoast, name:"bagel", description:"un super bagel" ,price_cents:"650", photo:"http://", category: "plat")
dishes3 = Dish.create!(foodtruck: eltacodeldiablo, name:"bagel", description:"un super bagel" ,price_cents:"750", photo:"http://", category: "plat")

puts "END"

# -------------------------------- Menu --------------------------------- #
puts "Seeding Menu"

menus1 = Menu.create!(foodtruck: bagin, name:'big bagel', description: "menu bagel complet avec salade", price_cents:'750')
menus2 = Menu.create!(foodtruck: westcoast, name:'big burger', description: "menu burger complet avec frites", price_cents:'1000')
menus3 = Menu.create!(foodtruck: eltacodeldiablo, name:'big tacos', description: "menu tacos complet avec accompagnement", price_cents:'800')
menus4 = Menu.create!(user: michel)

puts "END Seeding Menu"

# -------------------------------- Menu Dishes--------------------------------- #
puts "Seeding Menu Dishes"

MenuDish.create!(menu: menus1, dish: dishes1)
MenuDish.create!(menu: menus1, dish: dishes2)
MenuDish.create!(menu: menus2, dish: dishes2)
MenuDish.create!(menu: menus2, dish: dishes3)
MenuDish.create!(menu: menus3, dish: dishes1)
MenuDish.create!(menu: menus3, dish: dishes3)
MenuDish.create!(menu: menus4, dish: dishes1)
MenuDish.create!(menu: menus4, dish: dishes2)
MenuDish.create!(menu: menus4, dish: dishes3)

puts "END Seeding Menu"

# ------------------------- resavation ------------------------- #
puts "Seeding Reservations"

resa1 = Reservation.create!(foodtruck: bagin, user: michel, shift_datetime: DateTime.now + rand(2..30), review:'trop bon le bagel', mark:'4',payment_cents: '750',address: '30 place de la bourse, bordeaux')
resa2 = Reservation.create!(foodtruck: bagin, user: albert, shift_datetime: DateTime.now + rand(2..30), review:'trop bon le burger', mark:'3',payment_cents: '1000',address: '15 rue amélie, paris')
resa3 = Reservation.create!(foodtruck: westcoast, user: robert, shift_datetime: DateTime.now + rand(2..30), review:'trop bon le tacos', mark:'5',payment_cents: '800',address: '15 cours jean pénicaud, limoges')

puts "END"

# -------------------------------- Order_lines --------------------------------- #
puts "Seeding Order_lines"


panier1 = OrderLine.create!(reservation: resa1, menu: menus1, number_of_meals:"50", menu_price_cents: "750")
panier2 = OrderLine.create!(reservation: resa2, menu: menus2, number_of_meals:"80", menu_price_cents: "1000")
panier3 = OrderLine.create!(reservation: resa3, menu: menus3, number_of_meals:"100", menu_price_cents: "800")

puts "END"

# -------------------------------- Culinary_styles --------------------------------- #
puts "Seeding culinary_styles "

culinary_styles = CulinaryStyle.create!(title:"Occidentale")
culinary_styles = CulinaryStyle.create!(title:"Française")
culinary_styles = CulinaryStyle.create!(title:"Orientale")
culinary_styles = CulinaryStyle.create!(title:"Asiatique")
culinary_styles = CulinaryStyle.create!(title:"Afro")
culinary_styles = CulinaryStyle.create!(title:"Latine")
culinary_styles = CulinaryStyle.create!(title:"Espagnol")
culinary_styles = CulinaryStyle.create!(title:"Français")
culinary_styles = CulinaryStyle.create!(title:"Italien")
culinary_styles = CulinaryStyle.create!(title:"Allemand")
culinary_styles = CulinaryStyle.create!(title:"Cadadien")
culinary_styles = CulinaryStyle.create!(title:"Americain")
culinary_styles = CulinaryStyle.create!(title:"Méditerranéen")
culinary_styles = CulinaryStyle.create!(title:"Turc")
culinary_styles = CulinaryStyle.create!(title:"Libanais")
culinary_styles = CulinaryStyle.create!(title:"Indiens-Pakistanais")
culinary_styles = CulinaryStyle.create!(title:"Vietnamien")
culinary_styles = CulinaryStyle.create!(title:"Chinois")
culinary_styles = CulinaryStyle.create!(title:"Japonnais")
culinary_styles = CulinaryStyle.create!(title:"Coréen")
culinary_styles = CulinaryStyle.create!(title:"Créole")
culinary_styles = CulinaryStyle.create!(title:"Africain")
culinary_styles = CulinaryStyle.create!(title:"Mexicain")
culinary_styles = CulinaryStyle.create!(title:"Péruvien")
culinary_styles = CulinaryStyle.create!(title:"Argentin")
culinary_styles = CulinaryStyle.create!(title:"Colombien")
culinary_styles = CulinaryStyle.create!(title:"Vénézuelien")
culinary_styles = CulinaryStyle.create!(title:"Brésilien")
culinary_styles = CulinaryStyle.create!(title:"Burger")
culinary_styles = CulinaryStyle.create!(title:"Bagel")
culinary_styles = CulinaryStyle.create!(title:"Tapas")
culinary_styles = CulinaryStyle.create!(title:"Pizza")
culinary_styles = CulinaryStyle.create!(title:"Sandwich")
culinary_styles = CulinaryStyle.create!(title:"Hot-dog")
culinary_styles = CulinaryStyle.create!(title:"Crêpe et galette")
culinary_styles = CulinaryStyle.create!(title:"Tartine")
culinary_styles = CulinaryStyle.create!(title:"Salade")
culinary_styles = CulinaryStyle.create!(title:"Brochette")
culinary_styles = CulinaryStyle.create!(title:"Kefta")
culinary_styles = CulinaryStyle.create!(title:"Tajine")
culinary_styles = CulinaryStyle.create!(title:"Couscous")
culinary_styles = CulinaryStyle.create!(title:"Wok")
culinary_styles = CulinaryStyle.create!(title:"Bo-bun")
culinary_styles = CulinaryStyle.create!(title:"Sushis")
culinary_styles = CulinaryStyle.create!(title:"Banh_mi")
culinary_styles = CulinaryStyle.create!(title:"Pad thaï")
culinary_styles = CulinaryStyle.create!(title:"Carry")
culinary_styles = CulinaryStyle.create!(title:"BBQ")
culinary_styles = CulinaryStyle.create!(title:"Tacos")
culinary_styles = CulinaryStyle.create!(title:"Quesadilias")
culinary_styles = CulinaryStyle.create!(title:"Burrito")
culinary_styles = CulinaryStyle.create!(title:"Plats mijotés")
culinary_styles = CulinaryStyle.create!(title:"Soupe")
culinary_styles = CulinaryStyle.create!(title:"Glace + Frozen yogurt")
culinary_styles = CulinaryStyle.create!(title:"Alcool")

V






puts "END"

