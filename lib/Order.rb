class Order
  attr_reader :orders
  def initialize
    @orders
  end

  def basket(list)
    @orders = list
  end

  def total

  end
end
