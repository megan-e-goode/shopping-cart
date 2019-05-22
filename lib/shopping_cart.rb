require './lib/items.rb'

class ShoppingCart
  attr_reader :checkout, :items

  def initialize(items=Items.new)
    @checkout = []
    @items = items
  end

  def scan(item)
    scanned_item = @items.stock.select { |product| product[:item] == item }
    add_to_checkout(scanned_item)
  end

  def add_to_checkout(scanned_item)
    raise "Item is out of stock" unless @items.available?(scanned_item[0])
    @checkout.push(scanned_item[0])
  end
end
