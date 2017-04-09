require Dir.pwd+"/restaurant.rb"
require Dir.pwd+"/employee.rb"
require Dir.pwd+"/owner.rb"
require Dir.pwd+"/manager.rb"
require Dir.pwd+"/cook.rb"
require Dir.pwd+"/waiter.rb"
require Dir.pwd+"/dish_washer.rb"
require Dir.pwd+"/menu.rb"
require Dir.pwd+"/breakfast_menu.rb"
require Dir.pwd+"/lunch_and_dinner_menu.rb"
require Dir.pwd+"/menu_item.rb"
require Dir.pwd+"/customer.rb"
require Dir.pwd+"/inventory.rb"
require Dir.pwd+"/groccery.rb"

class Simulate
  def initialize
    
  end

  def create_resturant

    restaurant = Restaurant.new

    # Employees
    restaurant.add_employee(Owner.new('Rajesh', 50000.0))
    restaurant.add_employee(Cook.new('Monica', 30000.0))
    restaurant.add_employee(Waiter.new('Rachel', 15000.0))
    restaurant.add_employee(Waiter.new('Pheobe', 15000.0))
    restaurant.add_employee(DishWasher.new('Ross', 15000.0))
    restaurant.add_employee(Manager.new('Chandler', 40000.0))

    inventory = Inventory.new
    Groccery.build_grocceries(
      [
        {name: 'paneer', price: 180, quantity: 5},
        {name: 'rava', price: 30, quantity: 10},
        {name: 'rice', price: 50, quantity: 5},
        {name: 'chicken', price: 200, quantity: 10},
        {name: 'bread', price: 40, quantity: 20},
        {name: 'egg', price: 5.0, quantity: 50},
        {name: 'garam_masala',price: 20, quantity: 50}
      ]
    ).each { |groccery| inventory.add_grocceries(groccery) }

    restaurant.add_inventory(inventory)

    breakfast_menu = BreakfastMenu.new
    MenuItem.build_menu_items(
      [
        {
          name: 'Idli', 
          price: 10, 
          ingredients: inventory.find_grocceries_by_name(%w{ rice })
        },
        {
          name: 'Rava Idli', 
          price: 15, 
          ingredients: inventory.find_grocceries_by_name(%w{ rava })
        },
        {
          name: 'Dosa', 
          price: 30, 
          ingredients: inventory.find_grocceries_by_name(%w{ rice })
        },
        {
          name: 'Bread Omlette', 
          price: 25, 
          ingredients: inventory.find_grocceries_by_name(%w{ bread egg })
        },

      ]
    ).each { |item| breakfast_menu.add_item(item) }
    restaurant.add_menu(breakfast_menu)

    lunch_and_dinner_menu = LunchAndDinnerMenu.new
    MenuItem.build_menu_items(  
      [
        {
          name: 'Paneer Butter Masala', 
          price: 200, 
          ingredients: inventory.find_grocceries_by_name(%w{ paneer garam_masala})
        },
        {
          name: 'Chicken Masala', 
          price: 300, 
          ingredients: inventory.find_grocceries_by_name(%w{ chicken garam_masala})
        },
        {
          name: 'Egg Masala', 
          price: 100, 
          ingredients: inventory.find_grocceries_by_name(%w{ egg garam_masala})
        },
        {
          name: 'Veg Biryani', 
          price: 150, 
          ingredients: inventory.find_grocceries_by_name(%w{ rice garam_masala})
        },
        {
          name: 'Egg Biryani', 
          price: 150, 
          ingredients: inventory.find_grocceries_by_name(%w{ rice garam_masala egg})
        },
        {
          name: 'Chicken Biryani', 
          price: 150, 
          ingredients: inventory.find_grocceries_by_name(%w{ rice garam_masala chicken})}
      ]
    ).each { |item| lunch_and_dinner_menu.add_item(item) }
    restaurant.add_menu(lunch_and_dinner_menu)
    customer = Customer.new('Joey')

    return restaurant
  end  
end