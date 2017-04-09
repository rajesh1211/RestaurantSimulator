class MenuItem
  attr_accessor :name, :price
  def initialize(name, price, ingredients)
    @ingredients = ingredients
    self.name = name
    self.price = price
  end

  def add_ingredient(ingredient)
    @ingredients << ingredient
  end  

  def self.build_menu_items(items)
    menu_items = []
    items.each do |item|
      menu_items << MenuItem.new(item[:name], item[:price], item[:ingredients])
    end  
    return menu_items
  end  
end