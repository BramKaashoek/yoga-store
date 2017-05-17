@shopping_cart = []

@departments = [ :mats, :props, :clothes, :books ]

@products = {
  mats: [
    { reference_number: 1231, name: "Super Lite Mat", price: 10 },
    { reference_number: 1232, name: "Power Mat", price: 20 },
  ],
  props: [
    { reference_number: 1233, name: "Block", price: 30 },
    { reference_number: 1234, name: "Meditation cushion", price: 30 },
  ],
  clothes: [
    { reference_number: 1235, name: "The best T-shirt", price: 200 },
    { reference_number: 1236, name: "The cutest yoga pants", price: 300 },
  ],
  books: [
    { reference_number: 1237, name: "Bring Yoga To Life", price: 30 },
    { reference_number: 1238, name: "Light On Yoga", price: 10 },
  ]
}


#welcome
def welcome
 puts "Welcome to the Yoga store! Have fun shopping!"
 select_department
end

#select department, create set of active items and print products
def select_department
  departments = products.keys
  puts "The available departments are #{departments}"
end

# buy product [add to cart] or return to select department
#when buying puts cart and total price
# when buying ask if you want to continue, continue to select depart, stop to checkout

def main
  welcome
end

main
