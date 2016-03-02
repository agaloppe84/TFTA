
User.destroy_all
Reservation.destroy_all
OrderLine.destroy_all
Menu.destroy_all
Foodtruck.destroy_all
Dish.destroy_all
CulinaryStyle.destroy_all

puts "Seed started"
 # -------------------------------- Users --------------------------------- #
puts "Seeding User"

michel = User.create!(first_name: 'michel',last_name: 'patoudatchi',address: "30 place de la bourse, bordeaux",age:'22' ,trucker: false, email:'michel@gmail.com', password: "1234soleil")
albert = User.create!(first_name: 'albert',last_name: 'roso',address: "15 rue amélie, paris",age:'25' ,trucker: false, email:'albert@gmail.com', password: "1234soleil")
robert = User.create!(first_name: 'robert',last_name: 'lamarche',address: "15 cours jean pénicaud, limoges",age:'26' ,trucker: true, email:'robert@gmail.com', password: "1234soleil")

puts "END"
# ------------------------- resavation ------------------------- #
puts "Seeding Reservations"

resa1 = Reservation.create!(user: michel, shift_datetime: DateTime.now + rand(2..30), review:'trop bon le bagel', mark:'4',payment_cents: '750',address: '30 place de la bourse, bordeaux',
      accepted_at:"???", refused_at:"????")
resa2 = Reservation.create!(user: albert, shift_datetime: DateTime.now + rand(2..30), review:'trop bon le burger', mark:'3',payment_cents: '1000',address: '15 rue amélie, paris',
      accepted_at:"???", refused_at:"????")
resa3 = Reservation.create!(user: robert, shift_datetime: DateTime.now + rand(2..30), review:'trop bon le tacos', mark:'5',payment_cents: '800',address: '15 cours jean pénicaud, limoges',
      accepted_at:"???", refused_at:"????")
puts "END"
# -------------------------------- Order_lines --------------------------------- #
puts "Seeding Order_lines"


panier1 = OrderLine.create!(number_of_meals:"50", menu_price_cents: "750")
panier2 = OrderLine.create!(number_of_meals:"80", menu_price_cents: "1000")
panier3 = OrderLine.create!(number_of_meals:"100", menu_price_cents: "800")

puts "END"
# -------------------------------- Menu --------------------------------- #
puts "Seeding Menu"

menus1 = Menu.create!(name:'big bagel', description: "menu bagel complet avec salade", photo:'???', price_cents:'750')
menus2 = Menu.create!(name:'big burger', description: "menu burger complet avec frites", photo:'???', price_cents:'1000')
menus3 = Menu.create!(name:'big tacos', description: "menu tacos complet avec accompagnement", photo:'???', price_cents:'800')

puts "END Seeding Menu"
# -------------------------------- Foodtruck --------------------------------- #
puts "Seeding Foodtruck"

bagin = Foodtruck.create!(sku:"", name:"Bag in", format:"truck", min_capacity:"40", max_capacity:"250", free_radius_max:"50", radius_max:"150", km_price_cents:"120", address:"bordeaux")
westcoast = Foodtruck.create!(sku:"", name:"West Coast", format:"truck", min_capacity:"60", max_capacity:"250", free_radius_max:"50", radius_max:"150", km_price_cents:"120", address:"limoges")
eltacodeldiablo = Foodtruck.create!(sku:"", name:"El tacos del Diablo", format:"truck", min_capacity:"80", max_capacity:"250", free_radius_max:"50", radius_max:"150", km_price_cents:"120", address:"paris")

puts "END"
# -------------------------------- Dish --------------------------------- #
puts "Seeding Dishes"

dishes1 = Dish.create!(foodtruck: bagin, name:"bagel au saumon", description:"un délicieux bagel au saumon" ,price_cents:"500", photo:"http://", category:"entrée", gluten: false, bio: false, vegetarien: false)
dishes2 = Dish.create!(foodtruck: westcoast, name:"bagel", description:"un super bagel" ,price_cents:"650", photo:"http://", category:"plat", gluten: false, bio: false, vegetarien: false)
dishes3 = Dish.create!(foodtruck: eltacodeldiablo, name:"bagel", description:"un super bagel" ,price_cents:"750", photo:"http://", category:"dessert", gluten: false, bio: false, vegetarien: false)

puts "END"
# -------------------------------- Culinary_styles --------------------------------- #
puts "Seeding culinary_styles "

culinary_styles = CulinaryStyle.create!(title:"street food")

puts "END"

