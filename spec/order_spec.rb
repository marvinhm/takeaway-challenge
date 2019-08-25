require './lib/Order'

describe Order do

  describe '#total' do

    it 'Should take the basket and return a sum of the order' do
      order = Order.new
      list = [{:dish => "Bacon", :price => 1}, {:dish => "Apple pie", :price => 3}]
      order.basket(list)

      expect(order.total).to eq("£4")

      # allow(order1).to receive(:orders) {  }
      # allow(order1).to receive(:total) { [{:dish => "Bacon", :price => 1}, {:dish => "Apple pie", :price => 3}] }


    end


  end
end
