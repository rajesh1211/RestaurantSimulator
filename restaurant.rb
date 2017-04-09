class Restaurant
  attr_accessor :name, :rent, :security, :seating_capacity, :employees, :menus , :inventory 	
  def initialize
    @employees = []
    @menus = []
    @inventory = nil
  end  

  def add_inventory(inventory)
    @inventory = inventory
  end

  def add_groccery(item)
    @inventory.add_grocceries(item)
  end  

  def add_employee(employee)
    @employees << employee
  end  

  def add_menu(menu)
    @menus << menu
  end  

  def show_menu
    @menus.each do |menu|
      puts menu.class.name + " >>>>>>>>>"
      menu.items.each do |item|
        puts "\t name: #{item.name} price: #{item.price}"
      end
    end  
  end
end