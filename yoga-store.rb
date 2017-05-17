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
  if @departments.include? department.to_sym
    show_products(department)
  else
    select_department
  end
end

#show available products in this department
def show_products(department)
  department_products = @products.select {|k, v| k == department.to_sym}.values.flatten
  valid_product_numbers = []
  department_products.each do |product|
     puts "You can buy the #{product[:name]} for #{product[:price]}. Product number is #{product[:reference_number]}."

   end
   buy_or_return(department_products)
end

# buy product [add to cart] or return to select department
def buy_or_return(department_products)
  puts "Would you like to buy an item? (Y/N)\nIf you do not buy an item, you will be returned to the department selection screen."
  buy = gets.chomp.upcase
  if buy == "Y"
    add_item_to_cart(department_products)
  elsif buy == "N"
    puts "\e[H\e[2J"
    select_department
  else
    buy_or_return(department_products)
  end
end

#when buying puts cart
def add_item_to_cart(department_products)
  puts "Please enter the product number of the item you wish to add to your cart"
  product_number = gets.chomp.to_i
  valid_product_numbers = []
  department_products.each do |product|
    valid_product_numbers << product[:reference_number]
    if product[:reference_number] == product_number
      @shopping_cart << product
      puts "\nItem #{product_number} added to your cart."
    end
  end
  if valid_product_numbers.include? product_number
    display_cart
    continue_shopping?
  else
    add_item_to_cart(department_products)
  end
end


#show contents of cart and total price
def display_cart
  puts "\n\tThe Yoga Store Shopping Cart"
  cart_bar
  total_price = 0
  @shopping_cart.each do |product|
    puts "#{product[:name]}\t\t\t\t#{product[:price]}"
    total_price += product[:price]
  end
  cart_bar
  puts "Total Price: \t\t\t\t#{total_price}"
  cart_bar
end

#graphics thing
def cart_bar
  puts "-" * 42
end

# when buying ask if you want to continue, continue to select depart, stop to checkout
def continue_shopping?
  puts "Would you like to continue_shopping? (Y/N)\nIf you don't, you will be sent to the checkout"
  choice = gets.chomp.upcase
  if choice == "Y"
    puts "\e[H\e[2J"
    select_department
  elsif choice == "N"
    checkout
  else
    continue_shopping
  end
end

#show cart final time and say bye
def checkout
  puts "\e[H\e[2J"
  puts "Thank you for shopping at the Yoga Store\nYour final shopping cart is displayed below.\n\n\n"
  display_cart
end



def main
  welcome
end

main
