require './lib/Order'

describe Order do

  describe '#total' do

    describe '.order_time' do
      it 'should return time of order' do
        order = Order.new
        expect(order.order_time).to eq("#{Time.now.hour+1}:#{Time.now.min}")
      end
    end

    it 'Should take the basket and return a sum of the order' do
      order = Order.new
      list = [{:dish => "Bacon", :price => 1}, {:dish => "Apple pie", :price => 3}]
      order.basket(list)

      expect(order.total).to eq(4)

      # allow(order1).to receive(:orders) {  }
      # allow(order1).to receive(:total) { [{:dish => "Bacon", :price => 1}, {:dish => "Apple pie", :price => 3}] }
    end
  end
  describe '#confirm' do
    it 'Should send text regarding order' do
      order = Order.new
      allow(order).to receive(:orders) { [{:dish => "Bacon", :price => 1}, {:dish => "Apple pie", :price => 3}] }
      p order.orders
      expect(order.confirm).to eq("Food is on it's way!")
    end
  end
end
