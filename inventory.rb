class Inventory
  def initialize
    @grocceries = []
  end  

  def add_grocceries(groccery)
    @grocceries << groccery
  end

  def find_groccery_by_name(name)
    item = @grocceries.select { |groccery| groccery.name == name }
    return item.size > 0 ? item.first : nil
  end

  def find_grocceries_by_name(names = [])
    items = []
    names.each do |name| 
      groccery = find_groccery_by_name(name)
      items << groccery if groccery
    end  
  end  
end  