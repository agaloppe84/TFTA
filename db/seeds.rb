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
puts "Destroying users"
User.destroy_all
puts "END"


# -------------------------------- Culinary_styles --------------------------------- #
puts "Seeding culinary_styles "

occidentale = CulinaryStyle.create!(title:"Occidentale")
francaise = CulinaryStyle.create!(title:"Française")
orientale = CulinaryStyle.create!(title:"Orientale")
asiatique = CulinaryStyle.create!(title:"Asiatique")
afro = CulinaryStyle.create!(title:"Afro")
latine = CulinaryStyle.create!(title:"Latine")
espagnol = CulinaryStyle.create!(title:"Espagnol")
français = CulinaryStyle.create!(title:"Français")
italien = CulinaryStyle.create!(title:"Italien")
allemand = CulinaryStyle.create!(title:"Allemand")
cadadien = CulinaryStyle.create!(title:"Cadadien")
americain = CulinaryStyle.create!(title:"Americain")
méditerranéen = CulinaryStyle.create!(title:"Méditerranéen")
turc = CulinaryStyle.create!(title:"Turc")
libanais = CulinaryStyle.create!(title:"Libanais")
indiens_Pakistanais = CulinaryStyle.create!(title:"Indiens-Pakistanais")
vietnamien = CulinaryStyle.create!(title:"Vietnamien")
chinois = CulinaryStyle.create!(title:"Chinois")
japonnais = CulinaryStyle.create!(title:"Japonnais")
coréen = CulinaryStyle.create!(title:"Coréen")
créole = CulinaryStyle.create!(title:"Créole")
africain = CulinaryStyle.create!(title:"Africain")
mexicain = CulinaryStyle.create!(title:"Mexicain")
péruvien = CulinaryStyle.create!(title:"Péruvien")
argentin = CulinaryStyle.create!(title:"Argentin")
colombien = CulinaryStyle.create!(title:"Colombien")
vénézuelien = CulinaryStyle.create!(title:"Vénézuelien")
brésilien = CulinaryStyle.create!(title:"Brésilien")
burger = CulinaryStyle.create!(title:"Burger")
bagel = CulinaryStyle.create!(title:"Bagel")
tapas = CulinaryStyle.create!(title:"Tapas")
pizza = CulinaryStyle.create!(title:"Pizza")
sandwich = CulinaryStyle.create!(title:"Sandwich")
hot_dog = CulinaryStyle.create!(title:"Hot-dog")
crêpe_et_galette = CulinaryStyle.create!(title:"Crêpe et galette")
tartine = CulinaryStyle.create!(title:"Tartine")
salade = CulinaryStyle.create!(title:"Salade")
brochette = CulinaryStyle.create!(title:"Brochette")
kefta = CulinaryStyle.create!(title:"Kefta")
tajine = CulinaryStyle.create!(title:"Tajine")
couscous = CulinaryStyle.create!(title:"Couscous")
wok = CulinaryStyle.create!(title:"Wok")
bo_bun = CulinaryStyle.create!(title:"Bo-bun")
sushis = CulinaryStyle.create!(title:"Sushis")
banh_mi = CulinaryStyle.create!(title:"Banh_mi")
pad_thaï = CulinaryStyle.create!(title:"Pad thaï")
carry = CulinaryStyle.create!(title:"Carry")
bbq = CulinaryStyle.create!(title:"BBQ")
tacos = CulinaryStyle.create!(title:"Tacos")
quesadilias = CulinaryStyle.create!(title:"Quesadilias")
burrito = CulinaryStyle.create!(title:"Burrito")
plats_mijotés = CulinaryStyle.create!(title:"Plats mijotés")
soupe = CulinaryStyle.create!(title:"Soupe")
glace_frozen_yogurt = CulinaryStyle.create!(title:"Glace + Frozen yogurt")
alcool = CulinaryStyle.create!(title:"Alcool")

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

bagin = Foodtruck.create!(user: paul, sku:"", name:"Bag in", format:"truck", min_capacity:"40", max_capacity:"250", free_radius_max:"50", radius_max:"150", km_price_cents:"120", address:"bordeaux", culinary_style: bagel, photo_urls:["http://thefoodtruck.agency/wp-content/uploads/2015/11/bagin-vignette.jpg","http://thefoodtruck.agency/wp-content/uploads/2015/11/Bagin-bandeau.jpg"])
westcoast = Foodtruck.create!(user: pierre, sku:"", name:"West Coast", format:"truck", min_capacity:"60", max_capacity:"250", free_radius_max:"50", radius_max:"150", km_price_cents:"120", address:"limoges", culinary_style: burger, photo_urls:["http://thefoodtruck.agency/wp-content/uploads/2015/11/WestCoastBurger-vignette.jpg","http://thefoodtruck.agency/wp-content/uploads/2015/11/WestCoastBurger-bandeau.jpg"])
eltacodeldiablo = Foodtruck.create!(user: agathe, sku:"", name:"El tacos del Diablo", format:"truck", min_capacity:"80", max_capacity:"250", free_radius_max:"50", radius_max:"150", km_price_cents:"120", address:"paris", culinary_style: bagel, photo_urls:["http://thefoodtruck.agency/wp-content/uploads/2015/11/eltacodeldiablo-vignette.jpg","http://thefoodtruck.agency/wp-content/uploads/2015/11/eltacodeldiablo-bandeau.jpg"])
lespouletoquees = Foodtruck.create!(user: dorothée, sku:"", name:"Les Poules Toquées", format:"truck", min_capacity:"80", max_capacity:"250", free_radius_max:"50", radius_max:"150", km_price_cents:"120", address:"paris", culinary_style: burger, photo_urls:["http://thefoodtruck.agency/wp-content/uploads/2016/03/lespoulestoquees-vignette.jpg","http://thefoodtruck.agency/wp-content/uploads/2016/03/lespoulestoquees-bandeau.jpg"])

eattheroad = Foodtruck.create!(user: martin, sku:"", name:"Eat The Road", format:"truck", min_capacity:"80", max_capacity:"250", free_radius_max:"50", radius_max:"150", km_price_cents:"120", address:"paris", culinary_style: burger, photo_urls:["http://thefoodtruck.agency/wp-content/uploads/2015/11/Eattheroad-vignette.jpg","http://thefoodtruck.agency/wp-content/uploads/2015/11/Eattheroad-bandeau1.jpg"])
k2meal = Foodtruck.create!(user: martin, sku:"", name:"K2meal", format:"truck", min_capacity:"80", max_capacity:"250", free_radius_max:"50", radius_max:"150", km_price_cents:"120", address:"paris", culinary_style: français, photo_urls:["http://thefoodtruck.agency/wp-content/uploads/2015/11/K2Meal-vignette.jpg","http://thefoodtruck.agency/wp-content/uploads/2015/11/K2Meal-bandeau.jpg"])


puts "END"

# -------------------------------- Dish --------------------------------- #
puts "Seeding Dishes"

dish_salade = Dish.create!(category: "entrée", foodtruck: bagin, name:"salade", description:"un délicieux bagel au saumon" ,price_cents:"500", photo_url: "http://thefoodtruck.agency/wp-content/uploads/2015/11/Eattheroad-streetfood.jpg")
dish_coca = Dish.create!(category: "entrée", foodtruck: bagin, name:"coca", description:"un délicieux bagel au saumon" ,price_cents:"500", photo_url: "http://thefoodtruck.agency/wp-content/uploads/2015/11/Eattheroad-streetfood.jpg")
dish_bagel = Dish.create!(category: "entrée", foodtruck: bagin, name:"bagel au saumon", description:"un délicieux bagel au saumon" ,price_cents:"500", photo_url: "http://thefoodtruck.agency/wp-content/uploads/2015/11/Eattheroad-streetfood.jpg")
dish_popcorn = Dish.create!(category: "entrée", foodtruck: westcoast, name:"popcorn", description:"un super bagel" ,price_cents:"650", photo_url: "http://thefoodtruck.agency/wp-content/uploads/2015/11/Eattheroad-streetfood.jpg")
dish_crepe = Dish.create!(category: "entrée", foodtruck: westcoast, name:"crépes", description:"un super bagel" ,price_cents:"650", photo_url: "http://thefoodtruck.agency/wp-content/uploads/2015/11/Eattheroad-streetfood.jpg")
dish_burger= Dish.create!(category: "entrée", foodtruck: westcoast, name:"burger", description:"un super bagel" ,price_cents:"650", photo_url: "http://thefoodtruck.agency/wp-content/uploads/2015/11/Eattheroad-streetfood.jpg")

dish_tacos = Dish.create!(category: "plat", foodtruck: eltacodeldiablo, name:"Tacos mexicanos", description:"un super bagel" ,price_cents:"750", photo_url: "http://static.fr.groupon-content.net/45/13/1400675201345.jpg")
dish_tacos1 = Dish.create!(category: "plat", foodtruck: eltacodeldiablo, name:"Tacos ", description:"un super bagel" ,price_cents:"650", photo_url: "http://monipag.com/benjamin-chelly/wp-content/uploads/sites/951/1317895826632.jpg")
dish_tacos2 = Dish.create!(category: "plat", foodtruck: eltacodeldiablo, name:"Tacos ", description:"un super bagel" ,price_cents:"850", photo_url: "http://www.voyagemexico.com/wp-content/uploads/2013/09/Tacos-Al-Pastor.jpg")
dish_tacos3 = Dish.create!(category: "plat", foodtruck: eltacodeldiablo, name:"Tacos ", description:"un délicieux bagel au saumon" ,price_cents:"500", photo_url: "http://images.marmitoncdn.org/recipephotos/multiphoto/50/5059a6c5-e976-4999-8496-d6716f580fe3_normal.jpg")
dish_tacos4 = Dish.create!(category: "plat", foodtruck: eltacodeldiablo, name:"Tacos ", description:"un délicieux bagel au saumon" ,price_cents:"600", photo_url: "https://www.plaisirslaitiers.ca/var/ezflow_site/storage/images/dairy-goodness/home/recipes/sizzling-mexican-fajitas/258709-2-eng-CA/sizzling-mexican-fajitas_large.jpg")
dish_tacos5 = Dish.create!(category: "plat", foodtruck: eltacodeldiablo, name:"Tacos ", description:"un délicieux bagel au saumon" ,price_cents:"700", photo_url: "http://p9.storage.canalblog.com/97/43/121291/35771674_p.jpg")

dish_entree1 = Dish.create!(category: "entrée", foodtruck: eltacodeldiablo, name:"Tomates farcies", description:"Tomates farcies à la mexicaine pour une entrée fraîche" ,price_cents:"300", photo_url: "http://www.cookismo.fr/wp-content/uploads/2012/09/tomates_farcies_guacamole_crevettes440%C2%A9christelle-vogel_cookismo.jpg")
dish_entree2 = Dish.create!(category: "entrée", foodtruck: eltacodeldiablo, name:"Salade mexicaine", description:"Salade mexicaine en fleurs de tortillas" ,price_cents:"250", photo_url: "http://www.moietcie.ca/sites/default/files/salade_a_la_mexicaine_vol5.jpg")
dish_entree3 = Dish.create!(category: "entrée", foodtruck: eltacodeldiablo, name:"Tex mex", description:"Guacamole, ceviche, nachos, tacos ou tortillas... dépaysement garanti avec une cuisine Mexicaine savoureuse." ,price_cents:"400", photo_url: "http://www.pratico-pratiques.com/uploads/images/recipe/orig/salade-mexicaine-en-fleurs-de-tortillas%20(1).jpeg")

dish_dessert1 = Dish.create!(category: "dessert", foodtruck: eltacodeldiablo, name:"Dessert chocolat", description:"Dessert au chocolat mexicain" ,price_cents:"400", photo_url: "http://www.preemodj.com/upload/2/c1/2c1975c1599969cc.jpg")
dish_dessert2 = Dish.create!(category: "dessert", foodtruck: eltacodeldiablo, name:"Gateau Tres Leche", description:"Très bon gateau mexicain" ,price_cents:"500", photo_url: "http://www.costa-rica.fr/wp-content/uploads/2012/12/gateau-tres-leche.jpg")
dish_dessert3 = Dish.create!(category: "dessert", foodtruck: eltacodeldiablo, name:"Dessert spécial", description:"gâteau au 3 laits mexicain" ,price_cents:"350", photo_url: "http://thefoodtruck.agency/wp-content/uploads/2015/11/Eattheroad-streetfood.jpg")


puts "END"

# -------------------------------- Menu --------------------------------- #
puts "Seeding Menu"

menus_bagin = Menu.create!(foodtruck: bagin, name:'big bagel', description: "menu bagel complet avec salade", price_cents:'750')
menus_westcoast = Menu.create!(foodtruck: westcoast, name:'big burger', description: "menu burger complet avec frites", price_cents:'1000')
menus_eltacodeldiablo1 = Menu.create!(foodtruck: eltacodeldiablo, name:'Big Tacos', description: "Menu tacos complet avec accompagnement", price_cents:'15000', photo_url: "http://cdn-femina.ladmedia.fr/var/femina/storage/images/cuisine/idees-de-menus/pitas-burgers-tacos-les-sandwichs-de-l-ete/petits-pains-en-recettes-pitas-burgers-tacos/tacos-de-chorizo/3352016-1-fre-FR/Tacos-de-chorizo_current_diaporama.jpg")
menus_eltacodeldiablo2 = Menu.create!(foodtruck: eltacodeldiablo, name:'Menu spécial Mexicain', description: "Menu tacos complet avec accompagnement et dessert", price_cents:'13000', photo_url: "http://cdn-femina.ladmedia.fr/var/femina/storage/images/cuisine/idees-de-menus/pitas-burgers-tacos-les-sandwichs-de-l-ete/petits-pains-en-recettes-pitas-burgers-tacos/tacos-de-chorizo/3352016-1-fre-FR/Tacos-de-chorizo_current_diaporama.jpg")


puts "END Seeding Menu"

# -------------------------------- Menu Dishes--------------------------------- #
puts "Seeding Menu Dishes"

menus_dish_bagin = MenuDish.create!(menu: menus_bagin, dish: dish_salade)
menus_dish_bagin = MenuDish.create!(menu: menus_bagin, dish: dish_coca)
menus_dish_bagin = MenuDish.create!(menu: menus_bagin, dish: dish_bagel)
menus_dish_westcoast = MenuDish.create!(menu: menus_westcoast, dish: dish_popcorn)
menus_dish_westcoast = MenuDish.create!(menu: menus_westcoast, dish: dish_crepe)
menus_dish_westcoast = MenuDish.create!(menu: menus_westcoast, dish: dish_burger)

menus_dish_eltacodeldiablo1 = MenuDish.create!(menu: menus_eltacodeldiablo1, dish: dish_entree2)
menus_dish_eltacodeldiablo1 = MenuDish.create!(menu: menus_eltacodeldiablo1, dish: dish_tacos4)
menus_dish_eltacodeldiablo1 = MenuDish.create!(menu: menus_eltacodeldiablo1, dish: dish_dessert2)

menus_dish_eltacodeldiablo2 = MenuDish.create!(menu: menus_eltacodeldiablo2, dish: dish_entree3)
menus_dish_eltacodeldiablo2 = MenuDish.create!(menu: menus_eltacodeldiablo2, dish: dish_tacos2)
menus_dish_eltacodeldiablo2 = MenuDish.create!(menu: menus_eltacodeldiablo2, dish: dish_dessert1)

puts "END Seeding Menu"

# ------------------------- reservation ------------------------- #
puts "Seeding Reservations"

resa1 = Reservation.create!(foodtruck: bagin, user: michel, shift_datetime: DateTime.now + rand(2..30), review:'trop bon le bagel', mark:'4',payment_cents: '750',address: '30 place de la bourse, bordeaux')
resa2 = Reservation.create!(foodtruck: bagin, user: albert, shift_datetime: DateTime.now + rand(2..30), review:'trop bon le burger', mark:'3',payment_cents: '1000',address: '15 rue amélie, paris')
resa3 = Reservation.create!(foodtruck: westcoast, user: robert, shift_datetime: DateTime.now + rand(2..30), review:'trop bon le tacos', mark:'5',payment_cents: '800',address: '15 cours jean pénicaud, limoges')

puts "END"

# -------------------------------- Order_lines --------------------------------- #
puts "Seeding Order_lines"


panier1 = OrderLine.create!(reservation: resa1, menu: menus_bagin, number_of_meals:"50", menu_price_cents: "750")
panier2 = OrderLine.create!(reservation: resa2, menu: menus_bagin, number_of_meals:"80", menu_price_cents: "1000")
panier3 = OrderLine.create!(reservation: resa3, menu: menus_bagin, number_of_meals:"100", menu_price_cents: "800")

puts "END"

