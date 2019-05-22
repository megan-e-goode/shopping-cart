require './lib/items.rb'

class ShoppingCart
  attr_reader :checkout, :items

  def initialize(items=Items.new)
    @checkout = []
    @items = items
  end

  def scan(item)
    scanned_item = @items.stock.select { |product| product[:item] == item }
    @checkout.push(scanned_item) if @items.available?(scanned_item)
  end
end
