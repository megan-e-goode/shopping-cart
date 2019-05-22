class Shopping_cart
  attr_reader :checkout, :stock

  def initialize(stock)
    @checkout = []
    @stock = stock
  end

  def scan(item)
    scanned_item = @stock.select { |product| product[:item] == item }
    @checkout.push(scanned_item)
  end
end
