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
  puts "The available departments are #{@departments.join(", ")}!\nPlease enter your selection"
  department = gets.chomp.downcase
  show_products(department)
end

#show available products in this department
def show_products(department)
  department="mats"
  department_products = @products.select {|k, v| k == department.to_sym}.values.flatten
  department_products.each do |product|
     puts "You can buy the #{product[:name]} for #{product[:price]}. Item code is #{product[:reference_number]}."
   end
   buy_or_return(department_products)
end

def buy_or_return(department_products)
  puts "Would you like to buy an item? (Y/N)\n If you do not buy an item, you will be returned to the department selection screen."
  buy = gets.chomp.upcase
  if buy == "Y"
    buy_item(department_products)
  elsif buy == "N"
    puts "\e[H\e[2J"
    select_department
  else
    buy_or_return(department_products)
  end
end

def buy_item(department_products)

end
# buy product [add to cart] or return to select department
#when buying puts cart and total price
# when buying ask if you want to continue, continue to select depart, stop to checkout

def main
  welcome
end

main
