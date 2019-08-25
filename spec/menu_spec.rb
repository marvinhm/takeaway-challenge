require './lib/Menu'
require './lib/Order'


describe Menu do
  describe '#show_menu' do
    it 'return a list' do
      # menu = class_double('Menu')
      #
      # expect(menu).to receive(:show_menu).and_return([])
      #
      # menu.show_menu
      menu1 = Menu.new
      expect(menu1.show_menu.instance_of?(Array)).to eq (true)
    end

    it 'Should be a list of hashes' do
      menu1 = Menu.new
      expect(menu1.show_menu.first.instance_of?(Hash)).to eq(true)
    end

    it 'Contains dishes and prices' do
      menu1 = Menu.new
      expect(menu1.show_menu.first[:price].instance_of?(Integer)).to eq(true)
      expect(menu1.show_menu.first[:dish].instance_of?(String)).to eq(true)
    end

    # it 'should have an index that the Customercan use to order' do
    #   menu1 = Menu.new
    #   menu1.order(2)
    #   expect(menu1.customer_order).to include()
    # end
  end

  describe '#display_menu' do
    it 'should return an actual list of food' do
      menu1 = Menu.new
      expect(menu1.display_menu).to eq("1. Bacon: £1,\n 2. Apples: £0.8")
    end
  end

  # {:dish => "Bacon", :price => 1}

  describe '#order'do
    it 'Should store orders' do
      menu1 = Menu.new
      menu1.order(1)
      expect(menu1.orders).to include({:dish => "Bacon", :price => 1})
    end

    it 'should pass orders to Order' do
      menu1 = Menu.new
      menu1.order(1)
      order = Order.new
      # allow(order).to receive(:orders).with({:dish => "Bacon", :price => 1})
      menu1.order_items(order, menu1.orders)
      expect(order.orders).to include({:dish => "Bacon", :price => 1})
    end
  end
end
