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
      menu1.add_to_basket

      menu1.order_items(8)
      order = Order.new
      # allow(order).to receive(:orders).with({:dish => "Bacon", :price => 1})

      expect(menu1.orders).to include({:dish => "Bacon", :price => 1})
    end
  end

  describe '#order_items' do
    it 'should return a nice message if amount matches the order total' do
      menu1 = Menu.new
      menu1.order(1)
      amount = 1
      menu1.add_to_basket
      # "#{Time.now.hour}:#{Time.now.min}"
      expect(menu1.order_items(amount)).to eq("Thank you, your order was successfull, and will arrive at #{Time.now.hour+1}:#{Time.now.min}!")
    end

    describe '#add_to_basket' do
      it 'should add orders to a basket' do
        menu1 = Menu.new

        expect(menu1.add_to_basket.instance_of?(Array)).to eq(true)
      end
    end

    it 'should return a nice message if amount matches the order total' do
      menu1 = Menu.new
      menu1.order(1)
      amount = 0.8
      menu1.add_to_basket
      expect(menu1.order_items(amount)).to eq("Sorry something was wrong with your order!")
    end
  end

  describe '#how_much' do
    it 'should return a price when the customer enquires' do
      menu1 = Menu.new
      menu1.order(1)
      menu1.add_to_basket
      menu1.order_items(1)
      # random_order = [{:dish => "Bacon Sandwich", :price => 3}, {:dish => "Chocolate Milk", :price => 1.5}]

      expect(menu1.how_much).to eq("£1")
    end
  end
end
