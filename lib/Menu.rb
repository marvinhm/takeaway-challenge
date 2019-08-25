class Menu
  attr_reader :show_menu, :orders
  def initialize
    @show_menu = [{:dish => "Bacon", :price => 1}, {:dish => "Apples", :price => 0.8}]
    @orders = []

  end

  def display_menu
    str = ""
    @show_menu.each { |chr|
      if @show_menu.last != chr
        str << "#{@show_menu.index(chr) + 1}. #{chr[:dish]}: £#{chr[:price]},\n "
      else
        str << "#{@show_menu.index(chr) + 1}. #{chr[:dish]}: £#{chr[:price]}"
      end
        }
      str
  end

  def order(item)
    str = ''
    @show_menu.each { |chr|
      if item-1 == @show_menu.index(chr)
        @orders << chr
      else

      end
     }
     @orders
  end

  def order_items(order = Order.new, list)
    order.basket(list)
  end


end
