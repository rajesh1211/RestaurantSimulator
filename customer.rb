class Customer
  attr_reader :name
  def initialize(name)
    @name = name
    @order = []
  end  

  def make_order(item)
    @order << item
  end
end