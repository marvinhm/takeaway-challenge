require './sms'

class Order
  attr_reader :orders, :order_time
  def initialize
    @orders
    @order_time = "#{Time.now.hour+1}:#{Time.now.min}"
  end

  def basket(list)
    @orders = list
  end

  def total
    sum = 0
    @orders.each { |item|  sum += item[:price] }
    sum
  end

  def confirm(phone)
    send_message(phone)
    "Food is on it's way!"
  end
end
