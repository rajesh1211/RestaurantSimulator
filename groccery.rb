class Groccery
  attr_accessor :name, :price, :quantity

  def initialize(name, price, quantity)
    self.name = name
    self.price = price
    self.quantity = quantity
  end

  def self.build_grocceries(grocceries)
    _grocceries = []
    grocceries.each do |item| 
      _grocceries << Groccery.new(item[:name], item[:price], item[:quantity]) 
    end
    return _grocceries
  end  
end  